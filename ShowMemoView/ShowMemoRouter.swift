public final class ShowMemoRouter: ShowMemoWireframeProtocol {
     var viewController: ShowMemoViewController?
    
     static func createEditViewModule() -> ShowMemoViewController {
         let view = ShowMemoViewController()
         let router = ShowMemoRouter()
         let presenter = EditViewPresenter(interface: view, router: router)
         view.presenter = presenter
         router.viewController = view
         presenter.memoryManager = TableViewData.shared
         return view
    }
}
