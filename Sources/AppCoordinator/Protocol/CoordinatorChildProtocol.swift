import UIKit
@MainActor
public protocol CoordinatorProtocol: AnyObject {
    var parentCoordinator: CoordinatorProtocol? { get set }
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController? { get set }
    
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
    
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol)
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol)
}

public protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinators: CoordinatorProtocol)
}

@MainActor
public class BaseCoordinator: CoordinatorProtocol {

    public weak var parentCoordinator: CoordinatorProtocol?
    public weak var finishDelegate: CoordinatorFinishDelegate?
    public var childCoordinators: [CoordinatorProtocol] = []
    public var navigationController: UINavigationController?
    
    deinit {
        print("Coordinator deinited!")
    }
    
    public func start() {
        fatalError("start() has not been implemented")
    }
    
    public func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinators: self)
        parentCoordinator?.removeChildCoordinator(self)
        print("Coordinator finish!")
    }
    
    public func removeChildCoordinator(_ child: CoordinatorProtocol) {
        childCoordinators.removeAll() { $0 === child }
    }
    
    public func addChildCoordinator(_ child: CoordinatorProtocol) {
        childCoordinators.append(child)
        child.parentCoordinator = self
    }
}
