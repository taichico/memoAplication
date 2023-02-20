public final class EditRouter: EditWireframeProtocol {
     var viewController: EditViewController?
    
     static func createLaunchProcessModule() -> EditViewController {
         let view = EditViewController()
         let router = EditRouter()
         let presenter = EditViewPresenter(interface: view, router: router)
         view.presenter = presenter
         router.viewController = view
         return view
    }
}
