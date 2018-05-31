//
//  User+Firebase.swift
//  App
//
//  Created by Samvel Pahlevanyan on 4/26/18.
//
import JSON
import Foundation

extension SPFirebaseManager {
    
    func user(by phone: String) -> User? {
        if let userDict = firebase?.get(path: "users") as? [String:[String:Any]] {
            for (key, values) in userDict {
                if let userPhone = values["phone"] as? String, userPhone == phone {
                    let user = User.init(dic: values)
                    user.fireID = key
                    user.auth.token = AuthToken().generate()
                    return user
                }
            }
            //        return  userDict.map({User(dic: $0)}).filter({$0.phone == phone}).first
        }
        return nil
    }
    
    func create(by phone: String) -> User? {
        let newUser = User()
        newUser.phone = phone
        if let dict = firebase?.post(path: "users", value: newUser.makeDict()) {
            _ = firebase?.patch(path: "likes", value: [ dict.values.first as? String ?? "" : ""])
            _ = firebase?.patch(path: "social", value: [dict.values.first as? String ?? "" : [ "vk" : "",
                                                                                               "fb" : "",
                                                                                               "insta" : "",
                                                                                               "twiter" : ""]])

            return user(by: phone)
        }
        return nil
    }
    
    func update(by user: User) -> Bool {
        var updatingUser = user.makeDict()
        updatingUser["isUpdated"] = true
        if let _ = firebase?.patch(path: "users", value: [user.fireID: updatingUser]) {
            return true
        }
        return false
    }
 
    func update(by location: ARLocation) -> Bool {

        if let _ = firebase?.patch(path: "locations", value: [location.fireUserID: location.makeDict()]) {
            return true
        }
        return false
    }
}
