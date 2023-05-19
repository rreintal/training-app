//
//  APIConstants.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.04.2023.
//

import Foundation

class APIConstants {
    public static var API_BASE : String = "http://localhost:5187/api"
    public static var API_VERSION : String = "/v1.0"
    public static var API_ACCOUNT_CONTROLLER : String = "/idendtity/account"
    public static var API_REFRESHTOKEN : String = "/RefreshToken"
    
    // withouth method
    public static var API_IDENDTITY = API_BASE + API_VERSION + API_ACCOUNT_CONTROLLER
}

class HTTPMediaType {
    public static var ApplicationJson : String = "application/json"
}

class HTTPHeader {
    public static var ContentType : String = "Content-Type"
    public static var Authorization : String = "Authorization"
}

class HTTPMethod {
    public static var POST : String = "POST"
    public static var GET : String = "GET"
    
    // vb pole vaja
    public static var DELETE : String = "DELETE"
}

class HTTPResponseCode {
    public static var UNAUTHORIZED : Int = 401
    public static var NOT_FOUND : Int = 404
    public static var OK : Int = 200
}
