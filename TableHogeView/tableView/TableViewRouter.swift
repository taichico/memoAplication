import UIKit

final class Router {
    public weak var viewController: TableViewController?
    
    static func showRoot(window: UIWindow?) {
        window?.rootViewController = TableViewController.init(nibName: "TableViewController", bundle: nil)
        window?.makeKeyAndVisible()
    }
    
    public func showLocusLabs(_ venueId: String) {
        let vc = UIStoryboard(name: "TableViewController", bundle: Bundle.main).instantiateInitialViewController()!
        let locusVc = vc as? LocusLabsViewProtocol
        locusVc?.setView(venueId)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

public protocol LocusLabsViewProtocol: class {
    func setView(_ venueId: String)
}
