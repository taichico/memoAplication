import UIKit

final class TableViewPresenter: TablePresenterProtocol {
    private var view: TableViewProtocol?
    private let router: TableWireframeProtocol
    public var tableViewDataProtocol: TableViewDataProtocol!
    
    /// コンストラクタ
    public init(interface: TableViewProtocol, router: TableWireframeProtocol) {
        self.view = interface
        self.router = router
    }
    
    func memoTap() {
        router.showMemoView()
    }
    
    func cellTap(text: String) {
        router.showEditView()
        tableViewDataProtocol.tableData(text: text)
    }

    func viewWillAppear() {
        view?.readFile = FileManager.default.readingFile() ?? ""
    }
}
