//
//  ApplicationCoordinator.swift
//  Router
//
//  Created by Алена Панченко on 27.12.2022.
//

import Foundation

/// Координатор приложения
final class ApplicationCoordinator: BaseCoordinator {
    
    // MARK: - Private Constants
    
    private enum Constants {
        static let userDefaultsKey = "login"
    }
    
    // MARK: - Public Methods
    
    override func start() {
        if UserDefaults.standard.bool(forKey: Constants.userDefaultsKey) {
            toCoctailsBar()
        } else {
            toRegistration()
        }
    }
    // MARK: - Private Methods
    
    private func toCoctailsBar() {
        let coordinator = MainCoctailsBarCoordinator()
        coordinator.onFinishFlow = { [weak self, weak coordinator] in
            guard let self else { return }
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func toRegistration() {
        let coordinator = LoginCoordinator()
        coordinator.onFinishFlowHandler = { [weak self, weak coordinator] in
            guard let self else { return }
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
}
