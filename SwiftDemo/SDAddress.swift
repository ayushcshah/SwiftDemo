//
//  SDAddress.swift
//  SwiftDemo
//
//  Created by Ayush Shah on 4/7/16.
//  Copyright © 2016 Ayush Shah. All rights reserved.
//

import ObjectMapper

/**
 *  Address Model class. Subclassed from ObjectMapper.Mappable to map json object to class.
 */
struct SDAddress: Mappable {

    var street : String?
    var suite : String?
    var city : String?
    var zipCode : String?

    init(_ jsonObject: Map) {
        mapping(jsonObject)
    }

    mutating func mapping(jsonObject: Map) {
        street  <- jsonObject["street"]
        suite   <- jsonObject["suite"]
        city    <- jsonObject["city"]
        zipCode <- jsonObject["zipcode"]
    }

}
