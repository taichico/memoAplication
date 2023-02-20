import Foundation

final class EditViewPresenter: EditPresenterProtocol {

    private var view: EditViewProtocol?
    private let router: EditWireframeProtocol

    /// コンストラクタ
    public init(interface: EditViewProtocol, router: EditWireframeProtocol) {
        self.view = interface
        self.router = router
    }
}



