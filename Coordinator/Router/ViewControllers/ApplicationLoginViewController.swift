//
//  ApplicationLoginViewController.swift
//  Router
//
//  Created by Алена Панченко on 27.12.2022.
//

import UIKit

/// Экран входа в приложение
final class ApplicationLoginViewController: UIViewController {
    
    // MARK: - Private Constants
    
    private enum Constants {
        static let login = "1"
        static let password = "1"
        static let userDefaultKey = "login"
    }

    // MARK: Public IBOutlets
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Public Properties
   
    var toMainCoctailsBar: (() -> Void)?
    var toRegistration: (() -> Void)?
  
  // MARK: Private Methods
    
    @IBAction func entryButtonAction(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              login == Constants.login,
              password == Constants.password
                else
        {
            print("Логин или пароль не соответствуют")
            return
        }
        UserDefaults.standard.set(true, forKey: Constants.userDefaultKey)
        toMainCoctailsBar?()
        
        
    }
    
    @IBAction func registrationButtonAction(_ sender: Any) {
        toRegistration?()
    }
   

}
