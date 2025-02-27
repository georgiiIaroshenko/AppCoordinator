import UIKit

public protocol OnboardingFactoryProtocol {
    func makeOnboardingViewController(didFinishOnboarding: @escaping () -> Void) -> UIViewController
}

@MainActor
class OnboardingCoordinator: BaseCoordinator {
    
    private let factory: OnboardingFactoryProtocol
    
    public init(factory: OnboardingFactoryProtocol) {
        self.factory = factory
        super.init()
    }
    
    public override func start() {
        showOnboarding()
    }
    
    func showOnboarding() {
        let vc = factory.makeOnboardingViewController {
            print("didFinishOnboarding triggered")
            self.finish()
        }
    
        navigationController?.pushViewController(vc, animated: false)
    }
}
