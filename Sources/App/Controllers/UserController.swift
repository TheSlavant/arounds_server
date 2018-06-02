//
//  UserController.swift
//  App
//
//  Created by Samvel Pahlevanyan on 5/1/18.
//
import Vapor
import HTTP

final class UserController {
    
    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) -> Response {
        
        guard let phone = req.data["phone"]?.string else {
            return Response(status: .badRequest)
        }
        // hcack if user exist
        if let existingUser = SPFirebaseManager.shared.user(by: phone) {
            do {
                let jsonData = try existingUser.makeJSON()
                return try Response.init(status: .ok, json: jsonData)
            } catch {
                return Response(status: .badRequest)
            }
        } else if let newUser = SPFirebaseManager.shared.create(by: phone) {
            // create if user does not exist
            do {
                let jsonData = try newUser.makeJSON()
                return try Response.init(status: .created, json: jsonData)
            } catch {
                return Response(status: .badRequest)
            }
        }
        return Response(status: .badRequest)
    }
    
    func update(_ req: Request) -> Response {
        
        guard let fireID = req.data["fireID"]?.string,
            let phone = req.data["phone"]?.string,
            let nickName = req.data["nickName"]?.string,
            let aboute = req.data["aboute"]?.string,
            let avatar = req.data["avatar"]?.string,
            let fullName = req.data["fullName"]?.string,
            let firstName = req.data["firstName"]?.string,
            let lastName = req.data["lastName"]?.string,
            let birtDay = req.data["birtDay"]?.string,
            let gender = req.data["gender"]?.int else {
                return Response.init(status: .badRequest)
        }
        
        let user = User()
        user.fireID = fireID
        user.phone = phone
        user.nickname = nickName
        user.fullName = fullName
        user.firstName = firstName
        user.lastName = lastName
        user.gender = gender
        user.birtDay = birtDay
        user.aboute = aboute
        user.avatar = avatar
        if SPFirebaseManager.shared.update(by: user) {
            do {
                return try Response.init(status: .ok, json: JSON.init(["status": "ok"]))
            } catch {
                return Response(status: .badRequest)
            }
        } else {
            return Response.init(status: .notFound, body: "notFound")
        }
    }
    
    func updateLocation(_ req: Request) -> Response {
        guard let fireUserID = req.data["fireID"]?.string,
            let lng = req.data["lng"]?.double,
            let lat = req.data["lat"]?.double else {
                return Response.init(status: .badRequest)
        }
        
        let location = ARLocation()
        location.fireUserID = fireUserID
        location.lat = lat
        location.lng = lng
        location.updateDate = Date().timeIntervalSince1970
        if SPFirebaseManager.shared.update(by: location) {
            return Response.init(status: .ok)
        } else {
            return Response.init(status: .notFound)
        }
    }
    
    
    
    
}

