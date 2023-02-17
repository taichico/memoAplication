import UIKit
import SafariServices

public final class AppViewController: UIViewController {

    // MARK: Properties

    private var _currentViewController: UIViewController
    public var currentViewController: UIViewController {
        get { return _currentViewController }
        set { setCurrentViewController(newValue, animated: false) }
    }

    // MARK: - Life cycle

    public init(viewController: UIViewController) {
        _currentViewController = viewController
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        _currentViewController.addAsContainer(to: self, newFrame: view.bounds, animated: false)
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 子ビューが解放されているなら、再度読み込ませる
        if !_currentViewController.isViewLoaded {
            _currentViewController.view.frame = view.bounds
            view.addSubview(_currentViewController.view)
        }
    }

    // MARK: Rotate

    public override var shouldAutorotate: Bool {
        return currentViewController.shouldAutorotate
    }

    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return currentViewController.supportedInterfaceOrientations
    }

    // MARK: Statusbar

    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return currentViewController.preferredStatusBarStyle
    }

    public override var prefersStatusBarHidden: Bool {
        return currentViewController.prefersStatusBarHidden
    }

    public override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return currentViewController.preferredStatusBarUpdateAnimation
    }

    // MARK: Override

    // MARK: Methods

    public func setCurrentViewController(_ newViewController: UIViewController, animated: Bool) {
        guard _currentViewController != newViewController else {
            fatalError("currentViewController and newViewController is same.")
            return
        }
        let oldViewController = _currentViewController
        _currentViewController = newViewController
        _switchCurrentViewController(to: newViewController, from: oldViewController, animated: animated)
    }

    /// 現在表示中の画面を切り替える処理の実装.
    ///
    /// - Parameters:
    ///   - newViewController: 切り替え先の画面
    ///   - animated: アニメーション付きで切り替える場合はtrue. 無しならfalse.
    private func _switchCurrentViewController(to newViewController: UIViewController?, from oldViewController: UIViewController?, animated: Bool) {
        guard isViewLoaded else {
            // 画面未ロードの場合はここでは切り替え処理を行わない.
            // viewDidLoadで行う.
            return
        }
        guard oldViewController != newViewController else {
            // 切り替え前後が同じ画面の場合は何もしない
            return
        }
        // 切り替え前の画面を切り離し
        oldViewController?.removeFromContainer(animated: animated)
        // 切り替え後の画面を追加
        newViewController?.addAsContainer(to: self, newFrame: view.bounds, animated: animated)

        if let newView = newViewController?.view {
            // 他の画面を隠さないように最背面に移動
            view.sendSubviewToBack(newView)
        }
    }
}
