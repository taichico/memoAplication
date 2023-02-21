public protocol ShowMemoViewProtocol {
    var text: String { get set }
    func closeButtonTapped()
}
public protocol ShowMemoPresenterProtocol {
    func closeButtonTapped()
    func viewWillAppear()

}
public protocol ShowMemoWireframeProtocol {

}
