//
//  MainCoctailsBarViewController.swift
//  Router
//
//  Created by Алена Панченко on 27.12.2022.
//

import UIKit

/// Тип замыкания ничего не принимающего и не передающего
typealias VoidCompletion = (() -> Void)

/// Главный экран приложения
final class MainCoctailsBarViewController: UIViewController {
    
    // MARK: - Private Constants
    
    private enum Constants {
        static let userDefaultKey = "login"
    }
    
    // MARK: - Public Properties
    
    var toBarHandler: VoidCompletion?
    var toAboutUs: VoidCompletion?
    var toLogin: VoidCompletion?

    // MARK: - Private IBAction
    
    @IBAction private func toBarButtonAction(_ sender: Any) {
        toBarHandler?()
    }
    
    @IBAction private func toAboutUsButtonAction(_ sender: Any) {
        toAboutUs?()
    }
    
    @IBAction private func toBackButtonAction(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: Constants.userDefaultKey)
        toLogin?()
    }
    
}

