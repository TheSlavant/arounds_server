//
//  FirebaseManger.swift
//  App
//
//  Created by Samvel Pahlevanyan on 4/26/18.
//
import FirebaseSwift
import Foundation

class SPFirebaseManager {
    var firebase: Firebase?
    static let shared = SPFirebaseManager()
   
    private init() {
        
        firebase = Firebase.init(baseURL: "https://arounds-f1456.firebaseio.com/")
    }
}
