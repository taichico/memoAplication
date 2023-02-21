public protocol TableViewProtocol {
    var presenter: TablePresenterProtocol? { get set }
    var readFile: String { get set }
    var items: [String] { get set }
    var isEdit: Bool {get set }
    func editButtonTap(isFlag: Bool)
}
public protocol TablePresenterProtocol {
    func memoTap()
    func cellTap(text: String)
    func viewWillAppear()
    func editButtonTapped()
}
public protocol TableWireframeProtocol {
    func showMemoView()
    func showEditView()
}
