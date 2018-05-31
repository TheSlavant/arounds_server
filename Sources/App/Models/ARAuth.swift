//
//  ARAuth.swift
//  App
//
//  Created by Samvel Pahlevanyan on 5/3/18.
//

import Foundation

struct ARAuth {
    var token: String = ""
    
    init() {}
    init(dic: [String: Any]) {
        token = dic["token"] as? String ?? ""
    }

}

extension ARAuth: JSONConvertible {
    
    init(json: JSON) throws {
        try self.init(json: json)
    }
    
    func makeDict() -> [String:String] {
        return ["token": token]
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try? json.set("token", token)
        return json
    }
    
}
