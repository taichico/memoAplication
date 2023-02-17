import UIKit

final class TableViewPresenter: TablePresenterProtocol {
    private var view: TableViewProtocol?
    private let router: TableWireframeProtocol

    /// コンストラクタ
    public init(interface: TableViewProtocol, router: TableWireframeProtocol) {
        self.view = interface
        self.router = router
    }
    
    func memoTap() {
        router.showInFlightWiFi()
        print("show")
    }
    
    func editTap() {
        print("tttt")
    }
}

public protocol TableViewProtocol {
    var presenter: TablePresenterProtocol? { get set }
    func memoTapButton()
    func editTapButton()
}
public protocol TablePresenterProtocol {
    func memoTap()
    func editTap()
}
public protocol TableWireframeProtocol {
    func showInFlightWiFi()
}
