import UIKit

public final class AppCoordinator: BaseCoordinator, CoordinatorFinishDelegate {
    
    var router: RouterProtocol?
    
    public init(router: RouterProtocol? = nil) {
        self.router = router
        super.init()
    }
    
    public override func start() {
        router?.route(to: .onboarding, from: self)
    }
    
    public func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        if childCoordinator is OnboardingCoordinator {
            router?.route(to: .auth, from: self)
        } else if childCoordinator is AuthorizationCoordinator {
            router?.route(to: .main, from: self)
        }
    }
}
