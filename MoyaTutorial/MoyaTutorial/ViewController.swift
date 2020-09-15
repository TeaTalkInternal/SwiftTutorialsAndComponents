//
//  ViewController.swift
//  MoyaTutorial
//
//  Created by Kevin Vishal Saldanha on 14/09/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {
    
    let userService = MoyaProvider<UserService>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: Actions
    
    //Insert these values to DB
    @IBAction func insertIntoDb(_ sender: Any) {
        userService.request(UserService.createUser(firstName: "Benjamin", lastName: "Franklin", email: "BenjaminFranklin@gmail.com")) { (result) in
            switch result {
            case .success(let response):
                print("Response \(response.data)")
                do {
                    guard let json = try? JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.allowFragments) else {
                        print("No valid response returned from server")
                        return
                    }
                    print(json)
                }
            case .failure(let error):
                print("Failure \(error)")
            }
        }
    }
    
    //Delete the last values from DB
    @IBAction func deleteFromDb(_ sender: Any) {
        userService.request(UserService.deleteUser) { (result) in
            switch result {
            case .success(let response):
                do {
                    guard let json = try? JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.allowFragments) else {
                        print("No valid response returned from server")
                        return
                    }
                    print(json)
                }
            case .failure(let error):
                print("Failure \(error)")
            }
        }
    }
    
    //Update the last values in DB
    @IBAction func UpadteIntoDb(_ sender: Any) {
        userService.request(UserService.updateUser(firstName: "pretham")) { (result) in
            switch result {
            case .success(let response):
                do {
                    guard let json = try? JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.allowFragments) else {
                        print("No valid response returned from server")
                        return
                    }
                    print(json)
                }
            case .failure(let error):
                print("Failure \(error)")
            }
        }
    }
    
    //Display all values in DB
    @IBAction func displayFromDb(_ sender: Any) {
        userService.request(UserService.displayUsers) { (result) in
            switch result {
            case .success(let response):
                do {
                    guard let json = try? JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.allowFragments) else {
                        print("No valid response returned from server")
                        return
                    }
                    print(json)
                }
            case .failure(let error):
                print("Failure \(error)")
            }
        }
    }
}

