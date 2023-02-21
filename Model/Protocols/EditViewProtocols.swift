public protocol EditViewProtocol {
    var text: String { get set }
    func closeButtonTapped()
}
public protocol EditPresenterProtocol {
    func closeButtonTapped()
    func viewWillAppear()

}
public protocol EditWireframeProtocol {

}
