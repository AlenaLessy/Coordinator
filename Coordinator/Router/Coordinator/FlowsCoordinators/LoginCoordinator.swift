//
//  RegistrationCoordinator.swift
//  Router
//
//  Created by Алена Панченко on 27.12.2022.
//

import UIKit

/// Координатор экрана входа
final class LoginCoordinator: BaseCoordinator {
    // MARK: - Private Constants
    
    private enum Constants {
        static let storyboardName = "Main"
        static let registrationViewControllerIdentifier = "RegistrationViewController"
        static let mainCoctailsBarViewControllerIdentifier = "MainCoctailsBarViewControllerIdentifier"
        static let applicationLoginViewControllerIdentifier = "ApplicationLoginViewController"
    }
    
    // MARK: - Public Properties
    
    var rootController: UINavigationController?
    var onFinishFlowHandler: VoidHandler?
    
    // MARK: - Public Methods
    override func start() {
        showLoginModule()
    }
    
    // MARK: - Private Methods
    private func showLoginModule() {
        guard let viewController = UIStoryboard(name: Constants.storyboardName, bundle: nil)
            .instantiateViewController(withIdentifier: Constants.applicationLoginViewControllerIdentifier) as? ApplicationLoginViewController else { return }
        
        viewController.toMainCoctailsBarHandler = { [weak self] in
            guard let self else { return }
            self.onFinishFlowHandler?()
        }
        
        viewController.toRegistrationHandler = { [weak self] in
            guard let self else { return }
            self.showRegistration()
            
        }
        
       
        let rootController = UINavigationController(rootViewController: viewController)
        setAsRoot(rootController)
        self.rootController = rootController
    }
    
    
    private func showMainCoctailsBar() {
        guard let viewController = UIStoryboard(
            name: Constants.storyboardName,
            bundle: nil
        )
            .instantiateViewController(withIdentifier: Constants.mainCoctailsBarViewControllerIdentifier) as? MainCoctailsBarViewController
        else { return }
        
        rootController = UINavigationController(rootViewController: viewController)
        guard let rootController else { return }
        setAsRoot(rootController)
        
    }

        
        private func showRegistration() {
            guard let viewController = UIStoryboard(
                name: Constants.storyboardName,
                bundle: nil
            )
                .instantiateViewController(withIdentifier: Constants.registrationViewControllerIdentifier) as? RegistrationViewController
            else { return }
            rootController = UINavigationController(rootViewController: viewController)
            guard let rootController else { return }
            setAsRoot(rootController)
        }
    }
