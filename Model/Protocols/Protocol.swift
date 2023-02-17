import Foundation
import Common
import PromiseKit

public protocol PresenterProtocol: class {
}

public protocol ViewProtocol: class {
    /// エラーアラートを表示する
    func showErrorAlert(title: String?, message: String?)
    /// ローディングを表示/非表示にする
    func showLoading(_ isLoading: Bool)
    /// カレンダーへのアクセス許可設定オフ時のアラートを表示する
    func showCalendarAccessDeniedAlert()
}

public protocol WireframeProtocol: class {
    /// ブラウザで開く（即座に開く）
    func showBrowser<T: Common.URLRequestConvertible>(_ request: T, completion: @escaping () -> Void)
    /// ブラウザで開く（即座に開く）
    func showBrowser<T: Common.URLRequestConvertible>(_ request: T)
    /// ブラウザで開く（通信等をしてから開く）
    func showBrowser<T: Common.URLRequestConvertible, P: Thenable>(_ request: P, completion: @escaping () -> Void) where T == P.T
    /// ブラウザで開く（通信等をしてから開く）
    func showBrowser<T: Common.URLRequestConvertible, P: Thenable>(_ request: P) where T == P.T
    /// ブラウザで開く（認証クッキー）
    func showBrowser<P: Thenable>(_ request: P, completion: @escaping () -> Void) where P.T == BrowserRequestParamsViewObject
    /// ブラウザで開く（認証クッキー）
    func showBrowser<P: Thenable>(_ request: P) where P.T == BrowserRequestParamsViewObject
    // ブラウザで開く (認証クッキー)
    func showBrowser(_ request: BrowserRequestParamsViewObject)
    /// 外部ブラウザで開く
    func showOuterBrowser(_ url: URL)
}
