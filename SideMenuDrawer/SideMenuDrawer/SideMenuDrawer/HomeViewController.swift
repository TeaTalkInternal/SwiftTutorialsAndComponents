//
//  ViewController.swift
//  SideMenuDrawer
//
//  Created by Kevin Vishal Saldanha on 17/09/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var transition = SlideInTransition()
    var topView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction private func showMenu(_ sender : UIButton) {
        guard let menuVC = storyboard?.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else {
            return
        }
        menuVC.menuOptionSelected = { menuType in
            self.loadSelectedView(forMenuType: menuType)
        }
        menuVC.transitioningDelegate = self
        menuVC.modalPresentationStyle = .overCurrentContext
        present(menuVC, animated: true, completion: nil)
    }
    
    func loadSelectedView(forMenuType type : MenuType) -> Void {
       
        topView?.removeFromSuperview()
        self.title = "\(type)".capitalized
        
        switch type {
        case .home:
            guard let childView = storyboard?.instantiateViewController(identifier: "HomeViewController").view else {return}
            childView.frame = self.view.bounds
            self.view.addSubview(childView)
            self.topView = childView
        case .settings:
           guard let childView = storyboard?.instantiateViewController(identifier: "SettingsViewController").view else {return}
            childView.frame = self.view.bounds
            self.view.addSubview(childView)
            self.topView = childView
        }
    }
}

extension HomeViewController : UIViewControllerTransitioningDelegate {
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
}

