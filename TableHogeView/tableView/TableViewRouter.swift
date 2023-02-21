import UIKit

final class TableViewRouter: TableWireframeProtocol {
    
    public weak var viewController: TableViewController?
    
    /// Factory method
    public static func createModule() -> TableViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = TableViewController()
        let router = TableViewRouter()
        let presenter = TableViewPresenter(interface: view, router: router)
        view.presenter = presenter
        router.viewController = view
        presenter.tableViewDataProtocol = TableViewData.shared
        return view
    }
    
    public func showMemoView() {
        let vc = MemoRouter.createLaunchProcessModule()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        viewController?.present(nav, animated: true, completion: nil)
    }
    
    public func showEditView() {
        let vc = EditRouter.createLaunchProcessModule()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        viewController?.present(nav, animated: true, completion: nil)
    }
}

public class TableViewData: TableViewDataProtocol {
    
    public static let shared = TableViewData()
    
    var str: String = "hoge"
    
    func tableData(text: String) {
        str = text
    }
    
}

protocol TableViewDataProtocol {
    func tableData(text: String)
    var str: String { get }
}
