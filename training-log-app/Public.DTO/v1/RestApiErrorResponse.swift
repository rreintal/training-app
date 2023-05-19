//
//  RestApiErrorResponse.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.04.2023.
//

import Foundation

class RestApiErrorResponse : Codable {
    public var status : String
    public var Error : String
}
