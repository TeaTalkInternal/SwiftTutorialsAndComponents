//
//  AppConfiguration.swift
//  iOSBaseAppSetup
//
//  Created by Kevin.Saldanha on 01/03/23.
//

import Foundation

final class AppConfiguration {

    static let shared = AppConfiguration()
    private init() {}
    
    func getAppConfigConstantsFromPlist() -> AppConfigConstants? {
        guard let data = Utility.shared.infoPlistData else { return nil }
        let decoder = PropertyListDecoder()
        let config = try? decoder.decode(AppConfigConstants.self, from: data) as AppConfigConstants
        return config
    }
}


