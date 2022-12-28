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
    var onFinishFlowHandler: VoidCompletion?
    
    // MARK: - Public Methods
    override func start() {
        showLoginModule()
    }
    
    // MARK: - Private Methods
    private func showLoginModule() {
        guard let controller = UIStoryboard(name: Constants.storyboardName, bundle: nil)
            .instantiateViewController(withIdentifier: Constants.applicationLoginViewControllerIdentifier) as? ApplicationLoginViewController else { return }
        
        controller.toMainCoctailsBar = { [weak self] in
            guard let self else { return }
            self.onFinishFlowHandler?()
        }
        
        controller.toRegistration = { [weak self] in
            guard let self else { return }
            self.showRegistration()
            
        }
        
       
        let rootController = UINavigationController(rootViewController: controller)
        setAsRoot(rootController)
        self.rootController = rootController
    }
    
    
    private func showMainCoctailsBar() {
        guard let controller = UIStoryboard(
            name: Constants.storyboardName,
            bundle: nil
        )
            .instantiateViewController(withIdentifier: Constants.mainCoctailsBarViewControllerIdentifier) as? MainCoctailsBarViewController
        else { return }
        
        rootController = UINavigationController(rootViewController: controller)
        guard let rootController else { return }
        setAsRoot(rootController)
        
    }

        
        private func showRegistration() {
            guard let controller = UIStoryboard(
                name: Constants.storyboardName,
                bundle: nil
            )
                .instantiateViewController(withIdentifier: Constants.registrationViewControllerIdentifier) as? RegistrationViewController
            else { return }
            rootController = UINavigationController(rootViewController: controller)
            guard let rootController else { return }
            setAsRoot(rootController)
        }
    }
