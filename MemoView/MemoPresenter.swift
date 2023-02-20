import Foundation

final class MemoViewPresenter: MemoPresenterProtocol {

    private var view: MemoViewProtocol?
    private let router: MemoWireframeProtocol

    /// コンストラクタ
    public init(interface: MemoViewProtocol, router: MemoWireframeProtocol) {
        self.view = interface
        self.router = router
    }
    
    func saveButtonTapped(str: String) {
        FileManager.default.createFile()
        FileManager.default.appendText(string: str)
        print("save", str)
    }
    
    func closeButtonTapped() {
        view?.close()
        print("閉じる")
    }
}
