//
//  MainCoctailsBarCoordinator.swift
//  Router
//
//  Created by Алена Панченко on 27.12.2022.
//

import UIKit

/// Координатор главного экрана
final class MainCoctailsBarCoordinator: BaseCoordinator {
    // MARK: - Private Constants
    
    private enum Constants {
        static let storyboardName = "Main"
        static let barViewControllerIdentifier = "BarViewController"
        static let aboutUsViewControllerIdentifier = "AboutUsViewController"
        static let mainCoctailsBarViewControllerIdentifier = "MainCoctailsBarViewControllerIdentifier"
    }

    // MARK: - Public Properties
    
    var rootController: UINavigationController?
    var onFinishFlow: (() -> Void)?

    // MARK: - Public Methods
    override func start() {
        showMainModule()
    }

    // MARK: - Private Methods
    
    private func showMainModule() {
        guard let viewController = UIStoryboard(name: Constants.storyboardName, bundle: nil)
            .instantiateViewController(withIdentifier: Constants.mainCoctailsBarViewControllerIdentifier) as? MainCoctailsBarViewController else { return }
        
        viewController.toBarHandler = { [weak self] in
            guard let self else { return }
            self.showBar()
        }
        
        viewController.toAboutUs = { [weak self] in
            guard let self else { return }
            self.showAboutUs()
        }
        
        viewController.toLogin = { [weak self] in
            guard let self else { return }
            self.onFinishFlow?()
        }
        
        let rootController = UINavigationController(rootViewController: viewController)
        setAsRoot(rootController)
        self.rootController = rootController
    }


    private func showBar() {
        guard let viewController = UIStoryboard(
            name: Constants.storyboardName,
            bundle: nil
        )
        .instantiateViewController(withIdentifier: Constants.barViewControllerIdentifier) as? BarViewController
        else { return }
        rootController?.pushViewController(viewController, animated: true)
    }
    
    private func showAboutUs() {
        guard let viewController = UIStoryboard(
            name: Constants.storyboardName,
            bundle: nil
        )
        .instantiateViewController(withIdentifier: Constants.aboutUsViewControllerIdentifier) as? AboutUsViewController
        else { return }
        rootController?.pushViewController(viewController, animated: true)
    }
}
