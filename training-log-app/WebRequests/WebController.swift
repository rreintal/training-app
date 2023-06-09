//
//  WebController.swift
//  training-log-app
//
//  Created by Richard Reintal on 18.04.2023.
//

import Foundation



class WebController {

    func SendRegistration(registration: Register) async throws   -> Bool {
        // Define the URL and payload
        let urlString = APIConstants.API_IDENDTITY + "/register"
        print(urlString)
        guard let url = URL(string: urlString) else { return false}
        
        guard let encoded = try? JSONEncoder().encode(registration) else {
            print("Failed to encode login data")
            return false
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HTTPMethod.POST
        do {
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let decoder = JSONDecoder()
            print(response.description.utf8)
            let responseAsHTTPURL = response as? HTTPURLResponse
            if(responseAsHTTPURL?.statusCode == 405) {
                print("Error code 405!")
                //throw NSError(domain: "Registration failed!", code: 405)
                return false;
            }
            if(responseAsHTTPURL?.statusCode == 400) {
                print("Error code: 400")
                var error = try! decoder.decode(ErrorViewModel.self, from: data);
                print("error message = \(error.error)")
                throw NSError(domain: error.error, code: error.status)
            }
            if(responseAsHTTPURL?.statusCode == 200) {
                print("REGISTER succesful!")
                if let responseObject = try? decoder.decode(JWTResponse.self, from: data) {
                    print("Registration succesful!")
                    print("Saving JWT!")
                    AppEntry.AppState.jwt = responseObject.JWT
                    print("Saving refresh token!")
                    AppEntry.AppState.refreshToken = responseObject.RefreshToken
                    print("Saving user id!")
                    print("User id: \(responseObject.AppUserId?.description)")
                    AppEntry.AppState.appUserId = responseObject.AppUserId
                    
                }
                return true;
            }
            
        } catch let error as NSError{
            throw error
        }
        return false
    }
    
    func SendLogin(loginData : Login) async throws -> Bool {
        let urlString = APIConstants.API_IDENDTITY + "/login"
        print(urlString)
        guard let url = URL(string: urlString) else { return false}
        
        guard let encoded = try? JSONEncoder().encode(loginData) else {
            print("Failed to encode login data")
            return false
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do {
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            let decoder = JSONDecoder()
            
            let responseAsHTTPURL = response as? HTTPURLResponse
            if(responseAsHTTPURL?.statusCode == 405) {
                print("FAILED TO LOGIN STATUS CODE: 405")
                return false;
            }
            if(responseAsHTTPURL?.statusCode == 200) {
                
                if let responseObject = try? decoder.decode(JWTResponse.self, from: data) {
                    // Tee meetod, msi võtab sisse selle objekti ja mappib ise kõik ära!!
                    // siis kui miski muutub tuleb ainult ühes kohas muuta!!
                    print("Login succesful!")
                    print("Saving JWT!")
                    AppEntry.AppState.jwt = responseObject.JWT
                    print("Saving refresh token!")
                    AppEntry.AppState.refreshToken = responseObject.RefreshToken
                    print("Saving userId!")
                    AppEntry.AppState.appUserId = responseObject.AppUserId
                    
                }
                return true;
            }
            
            if(responseAsHTTPURL?.statusCode == 404) {
                var error = try! decoder.decode(ErrorViewModel.self, from: data)
                throw NSError(domain: error.error, code: error.status)
            }
            
        } catch let error as NSError{
            throw error
            print("Error")
        }
        return false
    }
    
    func sendRequest<T: Decodable>(urlString: String, method: String, payload: Encodable?, returnType: T.Type) async throws -> T {
        print("starting")
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = method
        request.setValue(HTTPMediaType.ApplicationJson, forHTTPHeaderField: HTTPHeader.ContentType)
        request.setValue("Bearer " + AppEntry.AppState.jwt!, forHTTPHeaderField: HTTPHeader.Authorization)
        
        // Set payload if it's not a GET request
        if method != HTTPMethod.GET, let payload = payload {
            request.httpBody = try? JSONEncoder().encode(payload)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NSError(domain: "", code: -1, userInfo: nil)
        }
        
        if httpResponse.statusCode == 401 {
            // Perform refresh token request here
            let refreshTokenModel = RefreshTokenModel(JWT: AppEntry.AppState.jwt!, refreshToken: AppEntry.AppState.refreshToken!)
            await RefreshToken(RefreshTokenModel: refreshTokenModel)
            
            // Retry the original request after refreshing the token
            return try await sendRequest(urlString: urlString, method: method, payload: payload, returnType: returnType)
        }
        
        do {
            let decodedData = try JSONDecoder().decode(returnType, from: data)
            return decodedData
        } catch {
            throw NSError(domain: "failed to decode object", code: 1)
        }
    }

    
    //
    
    func RefreshToken(RefreshTokenModel : RefreshTokenModel) async -> Int{
        let url = URL(string: APIConstants.API_IDENDTITY + APIConstants.API_REFRESHTOKEN)!
        print("Sending refresh token request to url: \(String(describing: url.description))")
        
        guard let encodedData = try? JSONEncoder().encode(RefreshTokenModel) else {
            print("Failed to encode data to RefreshToken")
            
            // TODO
            return HTTPResponseCode.NOT_FOUND;
        }
        
        var request = URLRequest(url: url)
        request.setValue(HTTPMediaType.ApplicationJson, forHTTPHeaderField: HTTPHeader.ContentType)
        request.httpMethod = HTTPMethod.POST
        
        do {
            let (data, response) = try await URLSession.shared.upload(for: request, from: encodedData)
            let httpResponse = response as? HTTPURLResponse;
            
            if httpResponse?.statusCode == HTTPResponseCode.OK {
                let decoder = JSONDecoder()
                if let responseObject = try? decoder.decode(JWTResponse.self, from: data) {
                    
                    // Set new JWT
                    AppStateHandler.UpdateJwt(changes: responseObject, appState: AppEntry.AppState)
                    print("Updated refresh token!")
                    return HTTPResponseCode.OK
                }
                else {
                    print("Failed to decode JWT response")
                    return HTTPResponseCode.NOT_FOUND
                }
                
            } else {
                print("REFRESH TOKEN FETCH FAILED - code \(httpResponse?.statusCode)")
            }
            // TODO!
            // kui on not found!
            // kui on unauthorized!
            // KUI EI SAA RESPONSE SIIS MINGI FORMAAT VALE JA SERVER ERROR I GUESS?
            return HTTPResponseCode.NOT_FOUND
            
        }
        catch {
            print("Error happened sending refresh token request to server")
            return HTTPResponseCode.NOT_FOUND
            
        }
        
        return HTTPResponseCode.NOT_FOUND
    }
    
}
protocol AppModel : Codable {}

