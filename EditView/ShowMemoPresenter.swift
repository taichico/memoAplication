import Foundation

final class EditViewPresenter: ShowMemoPresenterProtocol {
    private var view: ShowMemoViewProtocol?
    private let router: ShowMemoWireframeProtocol
    public var memoryManager: TableViewDataProtocol!

    /// コンストラクタ
    public init(interface: ShowMemoViewProtocol, router: ShowMemoWireframeProtocol) {
        self.view = interface
        self.router = router
    }

    func closeButtonTapped() {
        view?.closeButtonTapped()
    }
    
    func viewWillAppear() {
        view?.text = memoryManager.str
    }
}



