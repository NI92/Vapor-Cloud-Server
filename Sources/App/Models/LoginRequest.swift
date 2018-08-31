//
//  LoginRequest.swift
//  App
//
//  Created by TSL017 on 2018-08-30.
//

import Vapor

struct LoginRequest: Content {
    var email: String
    var password: String
}

