//
//  AlertPresenting.swift
//  AlertPresenting
//
//  Created by randhir kumar on 16/10/22.
//

import UIKit

public protocol AlertPresenting {
    func showAlert(title: String?, message: String?, completion: (() -> Void)?)
    func showChoiceAlert(title: String?, message: String?, alertActions: [UIAlertAction]?, completion: (() -> Void)?)
    func showChoiceActionSheet(title: String?, message: String?, alertActions: [UIAlertAction]?, completion: (() -> Void)?, barButtonItem: UIBarButtonItem?, sourceView: UIView?)
}

public extension AlertPresenting where Self: UIViewController {
    
    func showAlert(title: String? = nil, message: String? = nil, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let submit = UIAlertAction(title: "OK", style: .default)
        alert.addAction(submit)
        present(alert, animated: true, completion: completion)
    }
    
    func showChoiceAlert(title: String? = nil, message: String? = nil, alertActions: [UIAlertAction]? = nil, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertActions?.forEach({ alert.addAction($0) })
        present(alert, animated: true, completion: completion)
    }
    
    func showChoiceActionSheet(title: String? = nil, message: String? = nil, alertActions: [UIAlertAction]? = nil, completion: (() -> Void)? = nil, barButtonItem: UIBarButtonItem? = nil, sourceView: UIView? = nil) {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        if let popoverPresentationController = actionSheet.popoverPresentationController {
            if let barButtonItem = barButtonItem {
                popoverPresentationController.barButtonItem = barButtonItem
            } else if let sourceView = sourceView {
                popoverPresentationController.sourceView = sourceView
            }
        }
        
        alertActions?.forEach({ actionSheet.addAction($0) })
        present(actionSheet, animated: true, completion: completion)
    }
    
    func showActivityIndicatorAlert(title: String = "", completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.isUserInteractionEnabled = false
        activityIndicator.color = .green
        activityIndicator.startAnimating()

        alert.view.addSubview(activityIndicator)
        alert.view.heightAnchor.constraint(equalToConstant: 95).isActive = true

        activityIndicator.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor, constant: 0).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: alert.view.bottomAnchor, constant: -20).isActive = true

        present(alert, animated: true, completion: completion)
    }
}
