//
//  SDUser.swift
//  SwiftDemo
//
//  Created by Ayush Shah on 4/7/16.
//  Copyright © 2016 Ayush Shah. All rights reserved.
//

import ObjectMapper

/**
 *  User Model class. Subclassed from ObjectMapper.Mappable to map json object to class.
 */
struct SDUser: Mappable {

    var name: String?
    var username: String?
    var email: String?
    var phone: String?
    var website: String?
    var address : SDAddress?

    init?(_ jsonObject: Map) {
        mapping(jsonObject)
    }

    mutating func mapping(jsonObject: Map) {
        name        <- jsonObject["name"]
        username    <- jsonObject["username"]
        email       <- jsonObject["email"]
        phone       <- jsonObject["phone"]
        website     <- jsonObject["website"]
        address     <- jsonObject["address"]
    }
}
