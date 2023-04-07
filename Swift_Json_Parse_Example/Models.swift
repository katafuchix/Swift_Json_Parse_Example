//
//  Models.swift
//  Swift_Json_Parse_Example
//
//  Created by cano on 2023/04/08.
//

import Foundation

// resultsを格納する構造体
struct ResultListModel:Codable{
    let results : [Person]
}

// ユーザー情報を格納す構造体
struct Person: Codable  {
    let gender: String
    let name: Name
    let location: Location
    let login: Login
    let id: Id
    let picture: Picture
    
    struct Name: Codable  {
        let title: String
        let first: String
        let last: String
    }
    
    struct Location: Codable  {
        //let street: String
        let city: String
        let state: String
        let postcode: Int
    }
    
    let email: String
    
    struct Login: Codable {
        let username: String
        let password: String
        let salt: String
        let md5: String
        let sha1: String
        let sha256: String
    }
    
    //let dob: Dob
    //let registered: Registered
    let phone: String
    let cell: String
    
    struct Id: Codable {
        let name: String
        let value: String
    }
    
    struct Picture: Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
    
    struct Dob: Codable {
        let date: String
        let age: Int
    }
    
    struct Registered: Codable {
        let date: String
        let age: Int
    }
    
    let nat: String
}
