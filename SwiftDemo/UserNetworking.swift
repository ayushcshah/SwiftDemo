//
//  UserNetworking.swift
//  SwiftDemo
//
//  Created by Ayush Shah on 4/7/16.
//  Copyright © 2016 Ayush Shah. All rights reserved.
//

import ObjectMapper
import Alamofire

// swiftlint:disable variable_name
let APIManage = Manager.sharedInstance
// swiftlint:enable variable_name

/// User Networking class to call API related to user.
class UserNetworking {

    func getAllUser(completion: (users: [SDUser]?, error: NSError?) -> Void) {

        APIManage.request(UserRouterEnum.ReadAllUsers).responseJSON {

            (response: Response<AnyObject, NSError>) in

            switch response.result {

                case .Success(let result):
                    let usersData = Mapper<SDUser>().mapArray(result)
                    completion(users: usersData, error: nil)

                case .Failure(let error):
                    completion(users: nil, error: error)

            }

        }

    }

    func getUserBy(userID: String ,completion: (user: SDUser?, error: NSError?) -> Void) {

        APIManage.request(UserRouterEnum.ReadUserByID(userID)).responseJSON {

            (response: Response<AnyObject, NSError>) in

            switch response.result {

            case .Success(let result):
                let usersData = Mapper<SDUser>().map(result)
                completion(user: usersData, error: nil)

            case .Failure(let error):
                completion(user: nil, error: error)

            }

        }

    }
}
