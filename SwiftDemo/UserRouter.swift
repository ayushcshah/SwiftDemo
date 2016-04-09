//
//  UserRouter.swift
//  SwiftDemo
//
//  Created by Ayush Shah on 4/8/16.
//  Copyright © 2016 Ayush Shah. All rights reserved.
//

import Alamofire

enum UserRouterEnum : URLRequestConvertible {

    static let baseURL = NSURL(string: "http://jsonplaceholder.typicode.com/users")!

    case ReadAllUsers
    case ReadUserByID(String)

    var method: Alamofire.Method {
        switch self {
        case .ReadAllUsers, .ReadUserByID(_):
            return .GET
        }
    }

    var path: String {
        switch self {
        case .ReadUserByID(let userID):
            return userID
        default:
            return ""
        }
    }
    // swiftlint:disable variable_name
    var URLRequest: NSMutableURLRequest {
        let URL = UserRouterEnum.baseURL
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        return mutableURLRequest
    }
    // swiftlint:enable variable_name
}
