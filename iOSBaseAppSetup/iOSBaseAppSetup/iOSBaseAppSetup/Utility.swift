//
//  Utility.swift
//  iOSBaseAppSetup
//
//  Created by Kevin Vishal on 28/09/20.
//

import Foundation


struct Utility {
    
    static var baseURL : String {
      let url = Bundle.main.url(forResource: "Info", withExtension: "plist")!
             guard let data = try? Data(contentsOf: url) else { return "" }
             let decoder = PropertyListDecoder()
             let config = try? decoder.decode(AppConfigConstants.self, from: data) as AppConfigConstants
             return config?.BASE_API_URL ?? ""
    }
}
