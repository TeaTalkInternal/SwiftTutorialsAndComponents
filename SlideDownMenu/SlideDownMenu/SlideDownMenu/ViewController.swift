//
//  ViewController.swift
//  SlideDownMenu
//
//  Created by Kevin Vishal Saldanha on 16/09/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import UIKit

enum Categories : String {
    case sports = "Sports & Fitness"
    case electronics = "Electronics"
    case furniture = "Furniture"
    case kitchen = "Kitchen"
    case automobile = "Car & Bikes"
    
    func getIdentifier() -> String {
        return "\(self)"
    }
}

class ViewController: UIViewController {
    
    // MARK: Property Declarations
    @IBOutlet private var categorySelectorButton: UIButton!
    @IBOutlet private var categoryTypeButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addAccessibiltyIdentifiers()
    }
    
    // MARK: Button Actions
    @IBAction func catgoryOptionClicked(_ sender: UIButton) {
        self.printCategoryTitle(forButton: sender)
    }
    
    @IBAction func toggleCategoryVisibility(_ sender: UIButton) {
        self.showOrHideCategories()
    }
    
    private func addAccessibiltyIdentifiers() {
        //This is for UI Testing
        self.categorySelectorButton.isAccessibilityElement = true
        self.categorySelectorButton.accessibilityIdentifier = "category_btn"
        self.categoryTypeButtons.forEach { (_button) in
            guard let title = _button.currentTitle, let category = Categories(rawValue: title)
                else {
                    return
            }
            _button.isAccessibilityElement = true
            _button.accessibilityIdentifier = "\(category.getIdentifier())_btn"
        }
    }
}

// MARK: SlideView Related Methods
extension ViewController {
    
    //Show and Hide category Buttons with Animation
    func showOrHideCategories() -> Void {
        categoryTypeButtons.forEach { (_categoryButton) in
            UIView.animate(withDuration: 0.3, animations: {
                _categoryButton.isHidden = !_categoryButton.isHidden
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    //Show Title of Category Clicked
    func printCategoryTitle(forButton _button : UIButton) -> Void {
        guard let title = _button.currentTitle, let category = Categories(rawValue: title)
            else {
                return
        }
        print(category.rawValue)
    }
}

