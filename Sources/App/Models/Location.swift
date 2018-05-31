//
//  Location.swift
//  App
//
//  Created by Samvel Pahlevanyan on 5/14/18.
//

import Foundation

final class ARLocation {
    var fireUserID: String = ""
    
    var lat: Double = 0
    var lng: Double = 0
    var updateDate: Double = 0
}

extension ARLocation: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(json: json)
    }
    
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try? json.set("lat", lat)
        try? json.set("lng", lng)
        try? json.set("updateDate", updateDate)

        return json
    }
    
    func makeDict() -> [String: Any] {
        var dict = [String: Any]()
        dict["lat"] = lat
        dict["lng"] = lng
        dict["updateDate"] = updateDate

        return dict
    }

}
