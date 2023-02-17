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
        return view
    }
    
    public func showInFlightWiFi() {
        let vc = MemoRouter.createLaunchProcessModule()
        //ここがnilになる
        viewController?.navigationController?.pushViewController(vc, animated: true)
        print(viewController, vc, viewController?.navigationController?.pushViewController(vc, animated: true), "hogehoge")
    }

//    /// 機内Wi-Fi画面を開く
//     public func memoView() {
//         print("処理")
//        let vc = MemoViewController()
//        viewController.navigationController?.pushViewController(vc, animated: true)
//         print(viewController, vc, viewController.navigationController?.pushViewController(vc, animated: true), "hgoehoge")
//    }
}





//
//    public func showLocusLabs(_ venueId: String) {
//        let vc = UIStoryboard(name: "TableViewController", bundle: Bundle.main).instantiateInitialViewController()!
//        let locusVc = vc as? LocusLabsViewProtocol
//        locusVc?.setView(venueId)
//        viewController?.navigationController?.pushViewController(vc, animated: true)
//    }

//        tableViewController?.present(memoVC, animated: true, completion: nil)
//        vc.appViewController?.setCurrentViewController(memoVC, animated: true)
//        print(vc, vc.appViewController, "hogehoge")
