//
//  AuthorizationCoordinator.swift
//  AppCoordinator
//
//  Created by Георгий on 26.02.2025.
//

import UIKit

public protocol AuthorizationFactoryProtocol {
    func makeAuthorizationViewController(didFinishAuthorizationOnboarding: @escaping () -> Void) -> UIViewController
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
//    
//    func userDidFinishAuthorization() {
//            finish()
//        }
//    
    func showAuthorization() {
        let vc = factory.makeAuthorizationViewController { [weak self] in
            self?.finish()
        }
        navigationController?.pushViewController(vc, animated: false)
    }
}
