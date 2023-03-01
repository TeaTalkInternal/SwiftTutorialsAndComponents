//
//  Utility.swift
//  iOSBaseAppSetup
//
//  Created by Kevin Vishal on 28/09/20.
//

import Foundation

final class Utility {

    static let shared = Utility()
    private init() {}

    var infoPlistData:Data? {
        let url = Bundle.main.url(forResource: "Info", withExtension: "plist")!
        return try? Data(contentsOf: url)
    }
}


