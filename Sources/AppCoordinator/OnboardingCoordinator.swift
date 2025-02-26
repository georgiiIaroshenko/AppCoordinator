import UIKit

public protocol OnboardingFactoryProtocol {
    func makeOnboardingViewController() -> UIViewController
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
    
    func userDidFinishOnboarding() {
            finish()
        }
    
    override func finish() {
        super.finish()
        
        
    }
    
    func showOnboarding() {
        let vc = factory.makeOnboardingViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
