import Foundation

final class EditViewPresenter: EditPresenterProtocol {
    private var view: EditViewProtocol?
    private let router: EditWireframeProtocol
    public var tableViewDataProtocol: TableViewDataProtocol!

    /// コンストラクタ
    public init(interface: EditViewProtocol, router: EditWireframeProtocol) {
        self.view = interface
        self.router = router
    }
    
    func closeButtonTapped() {
        view?.closeButtonTapped()

    }
    
    func viewWillAppear() {
        print(tableViewDataProtocol.str)
        view?.text = tableViewDataProtocol.str
    }
}



