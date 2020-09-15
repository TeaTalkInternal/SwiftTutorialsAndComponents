//
//  UserNetworkService.swift
//  MoyaTutorial
//
//  Created by Kevin Vishal Saldanha on 14/09/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import Foundation
import Moya


enum UserService {
    case createUser(firstName : String, lastName : String, email : String)
    case deleteUser
    case updateUser(firstName : String)
    case displayUsers
}


extension UserService : TargetType {
    var baseURL: URL {
        return URL(string:"http://teatalk.one/moya_user/")!
    }
    
    var path: String {
        switch self {
        case .createUser:
            return "insert.php"
        case .deleteUser:
            return "delete.php"
        case .updateUser:
            return "update.php"
        case .displayUsers:
            return "select.php"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createUser:
            return .post
        case .deleteUser:
            return .delete
        case .updateUser:
            return .put
        case .displayUsers:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .displayUsers:
            return "[{'id': '28','first_name': 'vishal','last_name': 'kevin','email': 'vish@gmail.com'}]".data(using: .utf8)!
        default:
            return "[{ 'message': 'Successfully'}]".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        // Json Body
        case let .createUser(firstName, lastName, email):
            return .requestParameters(parameters: ["first_name": firstName,"last_name": lastName,"email": email], encoding:  JSONEncoding.default)
        case let .updateUser(firstName):
            return .requestParameters(parameters: ["first_name": firstName], encoding: JSONEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .createUser, .updateUser:
            return ["Content-Type" : "application/json"]
        default:
            return nil
        }
    }
}
