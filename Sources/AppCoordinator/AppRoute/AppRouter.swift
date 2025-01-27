import UIKit

public enum AppRoute {
    case onboarding
    case auth
    case main
}
@MainActor
public protocol RouterProtocol {
    func route(to route: AppRoute, from parent: CoordinatorProtocol)
}

public protocol FactoryProtocol: OnboardingFactoryProtocol {
    
}

@MainActor
public final class AppRouter: RouterProtocol {
    
    var factory: FactoryProtocol
    
    public init(factory: FactoryProtocol) {
        self.factory = factory
    }
    
    public func route(to route: AppRoute, from parent: CoordinatorProtocol) {
        switch route {
        case .onboarding:
            let onboardingCoordinator = OnboardingCoordinator(factory: factory)
            onboardingCoordinator.navigationController = parent.navigationController
            
            onboardingCoordinator.finishDelegate = parent as? CoordinatorFinishDelegate
            
            parent.addChildCoordinator(onboardingCoordinator)
            onboardingCoordinator.start()
        case .auth:
            break
        case .main:
            break
        }
    }
}
