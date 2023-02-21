import UIKit

final class TableViewPresenter: TablePresenterProtocol {
    private var view: TableViewProtocol?
    private let router: TableWireframeProtocol
    public var tableViewManager: TableViewDataProtocol!

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
        tableViewManager.tableData(text: text)
    }

    func viewWillAppear() {
        view?.readFile = FileManager.default.readingFile() ?? ""
    }

    func editButtonTapped() {
        view?.editButtonTap(isFlag: view?.isEdit ?? false)
    }
}
