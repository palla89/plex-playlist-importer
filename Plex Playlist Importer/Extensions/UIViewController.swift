//
//  UIViewController.swift
//  
//
//  Created by Francesco Cosenza on 07/11/2020.
//

import UIKit
import SwiftMessages

extension UIViewController {
    
    
    func createAlert(title : String, message : String){
        DispatchQueue.main.async {
            
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.info)
            view.configureDropShadow()
            view.configureContent(title: title, body: message)
            view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
            view.buttonTapHandler = { _ in SwiftMessages.hide() }
            view.button?.setTitle("Chiudi", for: .normal)
            
            var config = SwiftMessages.defaultConfig
            config.duration = .forever
            SwiftMessages.show(config: config, view: view)
        }
    }
    
    func createAlertComplete(title: String? = "Completato",message : String){
        DispatchQueue.main.async {
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.success)
            view.configureDropShadow()
            view.configureContent(title: title ?? "Completato", body: message, iconText: "💬")
            view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
            view.button?.isHidden = true
            SwiftMessages.show(view: view)
        }
    }
    
    func createAlertError(title: String? = "Errore",message : String?){
        DispatchQueue.main.async {
            
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.error)
            view.configureDropShadow()
            view.configureContent(title: title ?? "Errore", body: message ?? "", iconText: "☢️")
            view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
            view.buttonTapHandler = { _ in SwiftMessages.hide() }
            view.button?.setTitle("Chiudi", for: .normal)
            
            var config = SwiftMessages.defaultConfig
            config.duration = .forever
            SwiftMessages.show(config: config, view: view)
        }
    }
    
    func createAlertWarning(title: String? = "Attenzione", message : String?){
        DispatchQueue.main.async {
            
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.warning)
            view.configureDropShadow()
            view.configureContent(title: title ?? "Attenzione", body: message ?? "", iconText: "⚠️")
            view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10
            view.buttonTapHandler = { _ in SwiftMessages.hide() }
            view.button?.setTitle("Chiudi", for: .normal)
            
            var config = SwiftMessages.defaultConfig
            config.duration = .forever
            SwiftMessages.show(config: config, view: view)
        }
    }
    
    func createAlertError(error : Error){
        self.createAlertError(message: error.localizedDescription)
    }
}

