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
        router.showMemoView()
        print("show")
    }
    
    func editTap() {
        router.showEditView()
    }

    func viewWillAppear() {
        print(FileManager.default.readingFile(), "taichico")
        view?.readFile = FileManager.default.readingFile() ?? ""
    }
}
