//
//  AuthorizationCoordinator.swift
//  AppCoordinator
//
//  Created by Георгий on 26.02.2025.
//

import UIKit

public protocol AuthorizationFactoryProtocol {
    func makeAuthorizationViewController(didFinishAuthorization: @escaping () -> Void) -> UIViewController
}

@MainActor
class AuthorizationCoordinator: BaseCoordinator {
    
    private let factory: AuthorizationFactoryProtocol
    
    public init(factory: AuthorizationFactoryProtocol) {
        self.factory = factory
        super.init()
    }
    
    public override func start() {
        showAuthorization()
    }
    
    func showAuthorization() {
        let vc = factory.makeAuthorizationViewController { [weak self] in
            self?.userDidFinishAuthorization()
        }
        navigationController?.setViewControllers([vc], animated: true)
    }
    
    func userDidFinishAuthorization() {
            finish()
        }
    
}
