//
//  AppConfigConstants.swift
//  iOSBaseAppSetup
//
//  Created by Kevin Vishal on 28/09/20.
//

import Foundation

struct AppConfigConstants: Decodable {
    let BASE_API_URL: String
}

extension AppConfigConstants {

    static var baseURL : String? {
        return AppConfiguration.shared.getAppConfigConstantsFromPlist()?.BASE_API_URL
    }
}
