public final class MemoRouter: MemoWireframeProtocol {
     var viewController: MemoViewController?
    
     static func createLaunchProcessModule() -> MemoViewController {
         let view = MemoViewController()
         let router = MemoRouter()
         let presenter = MemoViewPresenter(interface: view, router: router)
         view.presenter = presenter
         router.viewController = view
         return view
    }
}
