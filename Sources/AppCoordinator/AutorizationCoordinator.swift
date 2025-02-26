import UIKit

public protocol AutorizationFactoryProtocol {
    func makeAutorizationViewController() -> UIViewController
}

@MainActor
class AutorizationCoordinator: BaseCoordinator {
    
    private let factory: AutorizationFactoryProtocol
    
    public init(factory: AutorizationFactoryProtocol) {
        self.factory = factory
        super.init()
    }
    
    public override func start() {
        showAutorization()
    }
    
    func userDidFinishAutorization() {
            finish()
        }
    
    func showAutorization() {
        let vc = factory.makeAutorizationViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
