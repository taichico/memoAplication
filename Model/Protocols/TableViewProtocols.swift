public protocol TableViewProtocol {
    var presenter: TablePresenterProtocol? { get set }
    var readFile: String { get set }
    var items: [String] { get set }
}
public protocol TablePresenterProtocol {
    func memoTap()
    func editTap()
    func viewWillAppear()
}
public protocol TableWireframeProtocol {
    func showMemoView()
    func showEditView()
}
