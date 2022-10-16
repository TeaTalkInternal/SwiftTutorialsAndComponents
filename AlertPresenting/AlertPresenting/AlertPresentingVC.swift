//
//  ViewController.swift
//  AlertPresenting
//
//  Created by randhir kumar on 16/10/22.
//

import UIKit

class AlertPresentingVC: UIViewController, AlertPresenting {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func ShowAlertAction(_ sender: UIButton) {
        showAlert(title: "Your Alert Title", message: "Your Message", completion: nil)
    }
    
    @IBAction func ShowChoiceAlertAction(_ sender: UIButton) {
        // pass on your alerts actions
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let deleteAction = UIAlertAction(title: "delete", style: .destructive, handler: nil)
        
        showChoiceAlert(title: "Your Choice Alert Title", message: "Your Message", alertActions: [deleteAction, okAction], completion: nil)
    }
    
    @IBAction func ShowChoiceAlertSheet(_ sender: UIButton) {
        // pass on your alerts actions
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let deleteAction = UIAlertAction(title: "delete", style: .destructive, handler: nil)
        
        showChoiceActionSheet(title: "Your Choice Alert Title", message: "Your Message", alertActions:  [deleteAction, okAction], completion: nil, barButtonItem: nil, sourceView: sender)
    }
    
}

