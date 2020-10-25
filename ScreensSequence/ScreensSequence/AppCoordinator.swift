import UIKit

class AppCoordinator {
    var startViewController: UIViewController?
    
    func run(in window: UIWindow) {
        let assembly = UserInfoAssembly()
        let root = assembly.nameViewController(with: self)
        window.rootViewController = root
        startViewController = root
    }
}

extension AppCoordinator: NameViewControllerCallback {
    func nameDone(in viewController: UIViewController) {
        let assembly = UserInfoAssembly()
        let vc = assembly.jobViewController(with: self)
        
        viewController.present(vc, animated: true, completion: nil)
    }
}

extension AppCoordinator: JobViewControllerCallback {
    func jobDone(in viewController: UIViewController) {
        let assembly = UserInfoAssembly()
        let vc = assembly.summaryViewController(with: self)
        
        viewController.present(vc, animated: true, completion: nil)
    }
}

extension AppCoordinator: SummaryViewControllerCallback {
    func summaryDone() {
        startViewController?.dismiss(animated: true, completion: nil)
    }
}
