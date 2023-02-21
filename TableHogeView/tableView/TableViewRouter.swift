import UIKit

final class TableViewRouter: TableWireframeProtocol {

    public weak var viewController: TableViewController?

    public static func createModule() -> TableViewController {
        let view = TableViewController()
        let router = TableViewRouter()
        let presenter = TableViewPresenter(interface: view, router: router)
        view.presenter = presenter
        router.viewController = view
        presenter.tableViewManager = TableViewData.shared
        return view
    }

    public func showMemoView() {
        let vc = MemoRouter.createLaunchProcessModule()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        viewController?.present(nav, animated: true, completion: nil)
    }
    
    public func showEditView() {
        let vc = ShowMemoRouter.createEditViewModule()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        viewController?.present(nav, animated: true, completion: nil)
    }
}
