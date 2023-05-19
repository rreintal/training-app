//
//  WebController.swift
//  training-log-app
//
//  Created by Richard Reintal on 18.04.2023.
//

import Foundation



class WebController {

    func SendRegistration(registration: Register) async -> Bool {
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
        request.httpMethod = "POST"
        do {
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)
            
            
            let responseAsHTTPURL = response as? HTTPURLResponse
            if(responseAsHTTPURL?.statusCode == 405) {
                return false;
            }
            if(responseAsHTTPURL?.statusCode == 200) {
                print("REGISTER succesful!")
                let decoder = JSONDecoder()
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
            
        } catch {
            print("Error")
        }
        return false
    }
    
    func SendLogin(loginData : Login) async -> Bool {
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
            print(data.description.utf8)
            let responseAsHTTPURL = response as? HTTPURLResponse
            if(responseAsHTTPURL?.statusCode == 405) {
                print("FAILED TO LOGIN STATUS CODE: 405")
                return false;
            }
            if(responseAsHTTPURL?.statusCode == 200) {
                let decoder = JSONDecoder()
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
            
        } catch {
            print("Error")
        }
        return false
    }

    
    
    // params - method, payload, return type?????,
    // @Method - POST, GET, DELETE
    // Maybe create a protocol which needs to be applied for returnType
    // @Payload - Model to send
    // @ReturnType - Model to recieve
    //
    // Return OBJECT
    func sendRequest(requestUrl : String,
                     httpMethod : String,
                     payload : AppModel,
                     ReturnType : AppModel.Type) async -> AppModel  {
        
        var done = false
        var result : AppModel = User(Name: "SERVER ERROR?")
        
        // Kuidas URL saab üldse null olla, kui input type on String?!
        let url = URL(string: requestUrl)!
        print("Sending \(httpMethod) request to \(url.description).")
        
        let encodedPayload = try? JSONEncoder().encode(payload);
        if encodedPayload == nil {
            print("Failed to encode data!")
            // ERROR HANDLING
        }
        
        var request = URLRequest(url: url)
        request.setValue(HTTPMediaType.ApplicationJson, forHTTPHeaderField: HTTPHeader.ContentType)
        request.setValue("Bearer " + AppEntry.AppState.jwt!, forHTTPHeaderField: HTTPHeader.Authorization)
        request.httpMethod = httpMethod
        
            
        repeat {
            // saada request
            do {
                
                let (data, response) = try await URLSession.shared.upload(for: request, from: encodedPayload!)
                let httpResponse = response as? HTTPURLResponse
                
                // KUI ON 401
                if httpResponse?.statusCode == HTTPResponseCode.UNAUTHORIZED {
                    print("JWT has expired.")
                    // Refreshi tokenit
                    // VB PROBLEEMNE, et võtan AppState JWT ja AppState refreshTokeni siit nii!
                    let refreshTokenModel = RefreshTokenModel(JWT: AppEntry.AppState.jwt!, refreshToken: AppEntry.AppState.refreshToken!)
                    var responseCode = await RefreshToken(RefreshTokenModel: refreshTokenModel)
                    
                    // Update authorization header
                    request.setValue("Bearer " + AppEntry.AppState.jwt!, forHTTPHeaderField: HTTPHeader.Authorization)
                    print("Changed Bearer token!")
                    
                    if(responseCode == HTTPResponseCode.NOT_FOUND) {
                        done = true
                        result = User(Name: "ERROR - SERVER ERROR, JWT REFRESH FAILED!")
                    }
                }
                if httpResponse?.statusCode == HTTPResponseCode.NOT_FOUND {
                    // Kui on 404
                    // done = true
                    // returni error
                    done = true;
                    result = User(Name: "RETURN ERROR- SERVER NOT FOUND!")
                }
                if httpResponse?.statusCode == HTTPResponseCode.OK {
                    // kui on 200
                    // done = true
                    // returni data
                    let decoder = JSONDecoder()
                    if let decodedData = try? decoder.decode(ReturnType.self, from: data) {
                        done = true;
                        result = decodedData
                    }else {
                        print(data.description.utf8)
                        print("Failed to decode result!")
                        done = true
                        result = User(Name: "RETURN ERROR- SERVER ERROR!")
                    }
                }
                
            }catch {
                // VB PROBLEMAATILINE!!!
                //print("Error sending request!")
                //done = true
                //result = User(Name: "ERROR SENDING RESULT - POSSIBLY SERVER PROBLEM!")
            }
        } while done == false
        
        return result
    }
    
    
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

