//
//  User.swift
//  App
//
//  Created by Samvel Pahlevanyan on 5/1/18.
//
import Vapor

final class User {
    
    var id: Int = 0
    var age: Int = 0
    var gender: Int = 1  // 1 male, 2 female
    var isUpdated: Bool = false
    var fireID: String = ""
    var phone: String = ""
    var fullName: String = ""
    var nickname: String = ""
    var birtDay: String = ""
    var aboute: String = ""
    var avatar: String = ""
    var auth: ARAuth = ARAuth()
    
    init() {}
    
    init(js:JSON) {
        id = js["id"]?.int ?? 0
        age = js["age"]?.int ?? 0
        gender = js["age"]?.int ?? 1
        isUpdated = js["isUpdated"]?.bool ?? false
        fireID = js["fireID"]?.string ?? ""
        phone = js["phone"]?.string ?? ""
        fullName = js["fullName"]?.string ?? ""
        nickname = js["nickname"]?.string ?? ""
        birtDay = js["birtDay"]?.string ?? ""
        aboute = js["aboute"]?.string ?? ""
        avatar = js["avatar"]?.string ?? ""
        do {
            auth = try ARAuth(json: js["avatar"]!)
        } catch _ {
            auth = ARAuth()
        }
    }
    
    init(dic: [String: Any]) {
        id = dic["id"] as? Int ?? 0
        age = dic["age"] as? Int ?? 0
        gender = dic["age"] as? Int ?? 1
        isUpdated = dic["isUpdated"] as? Bool ?? false
        phone = dic["phone"] as? String ?? ""
        fireID = dic["fireID"] as? String ?? ""
        fullName = dic["fullName"] as? String ?? ""
        nickname = dic["nickname"] as? String ?? ""
        birtDay = dic["birtDay"] as? String ?? ""
        aboute = dic["aboute"] as? String ?? ""
        avatar = dic["avatar"] as? String ?? ""
        auth = ARAuth.init(dic: dic["auth"] as? [String : Any] ?? [String : Any]())
    }
    
}


extension User: JSONConvertible {
    
    convenience init(json: JSON) throws {
        try self.init(json: json)
    }
    
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try? json.set("id", id)
        try? json.set("age", age)
        try? json.set("isUpdated", isUpdated)
        try? json.set("gender", gender)
        try? json.set("fireID", fireID)
        try? json.set("phone", phone)
        try? json.set("fullName", fullName)
        try? json.set("nickname", nickname)
        try? json.set("birtDay", birtDay)
        try? json.set("aboute", aboute)
        try? json.set("avatar", avatar)
        try? json.set("auth", auth.makeDict())
        return json
    }
    
    func makeDict() -> [String: Any] {
        var dict = [String: Any]()
        dict["id"] = id
        dict["age"] = age
        dict["isUpdated"] = isUpdated
        dict["gender"] = gender
        dict["fireID"] = fireID
        dict["phone"] = phone
        dict["fullName"] = fullName
        dict["nickname"] = nickname
        dict["birtDay"] = birtDay
        dict["aboute"] = aboute
        dict["avatar"] = avatar
        dict["auth"] = auth.makeDict()
        return dict
    }

    
}




