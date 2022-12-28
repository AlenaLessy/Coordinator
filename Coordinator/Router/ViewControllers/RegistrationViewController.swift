//
//  RegistrationViewController.swift
//  Router
//
//  Created by Алена Панченко on 27.12.2022.
//

import UIKit

/// UserHandler
typealias UserHandler =  ((User) -> ())

/// Экран регистрации
final class RegistrationViewController: UIViewController {
    
    // MARK: - Private Constants
    
    private enum Constants {
        static let login = "1"
        static let password = "1"
        static let userDefaultKey = "login"
        static let messageError = "не все поля заполнены"
    }
    
    // MARK: - Private IBOutlets
    
    @IBOutlet private weak var eMailTextField: UITextField!
    @IBOutlet private weak var phoneNumberTextField: UITextField!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - Public Properties
    
    var registrationHandler: UserHandler?
    var toBackHandler: VoidHandler?
    var user: User?
    
    // MARK: - Private IBAction
    
    @IBAction func registrationButtonAction(_ sender: Any) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text,
              let phone = phoneNumberTextField.text,
              let email = eMailTextField.text
        else {
            print(Constants.messageError)
            return
        }
        
        let user = User(eMail: email, password: password, login: login, phoneNumber: phone)
        
        registrationHandler?(user)
    }
    
    @IBAction func toBackButtonAction(_ sender: Any) {
        toBackHandler?()
    }
    
}
