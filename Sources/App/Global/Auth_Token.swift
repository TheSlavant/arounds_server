//
//  Auth_Token.swift
//  App
//
//  Created by Samvel Pahlevanyan on 5/3/18.
//

import Foundation

class AuthToken {
    
    func generate(length: Int = 40) -> String {
        
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//        let len = UInt32(letters.length)
        
        var randomString = ""
        
//        for _ in 0 ..< length {
//            let rand =  arc4random_uniform(len)
//            var nextChar = letters.character(at: Int(rand))
//            randomString += NSString(characters: &nextChar, length: 1) as String
//        }
        
        return letters
    }

}
