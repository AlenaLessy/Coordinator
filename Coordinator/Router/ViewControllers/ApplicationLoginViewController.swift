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
        static let errorMessage = "Логин или пароль не соответствуют"
    }

    // MARK: Private IBOutlets
    
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Public Properties
   
    var toMainCoctailsBar: VoidCompletion?
    var toRegistration: VoidCompletion?
  
  // MARK: Private IBAction
    
    @IBAction private func entryButtonAction(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              login == Constants.login,
              password == Constants.password
                else
        {
            print(Constants.errorMessage)
            return
        }
        UserDefaults.standard.set(true, forKey: Constants.userDefaultKey)
        toMainCoctailsBar?()
        
        
    }
    
    @IBAction private func registrationButtonAction(_ sender: Any) {
        toRegistration?()
    }
   

}
