//
//  MenuTableViewController.swift
//  SideMenuDrawer
//
//  Created by Kevin Vishal Saldanha on 17/09/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import UIKit

enum MenuType : Int {
    case home
    case settings
    
    func headerTitle() -> String {
        return "\(self)".capitalized
    }
}

class MenuViewController: UITableViewController {
    
    var menuOptionSelected: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    // MARK: - Table view delegates
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedMenu = MenuType(rawValue: indexPath.row) else {return}
        dismiss(animated: true) {
            self.menuOptionSelected?(selectedMenu)
        }
    }
}
