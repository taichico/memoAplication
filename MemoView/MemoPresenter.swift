import Foundation

final class MemoViewPresenter: MemoPresenterProtocol {

    private var view: MemoViewProtocol?
    private let router: MemoWireframeProtocol

    /// コンストラクタ
    public init(interface: MemoViewProtocol, router: MemoWireframeProtocol) {
        self.view = interface
        self.router = router
    }
}


// PresenterはInputプロトコルに準拠し、入力処理を受け付ける
extension MemoViewPresenter: MemoPresenterInput {
}

extension TableViewController: MemoPresenterOutput {
}


public protocol MemoViewProtocol {

}
public protocol MemoPresenterProtocol {

}
public protocol MemoWireframeProtocol {

}



