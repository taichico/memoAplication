import UIKit
import SafariServices

public extension UIViewController {

    /// self を Container ViewController に追加する.
    ///
    /// self が別の Container ViewController の子になっている場合でも、元々の親から削除してから指定した親に追加される.
    /// - Parameter toParent: Container View Controller.
    /// - Parameter newFrame: self.view に設定するframe.
    /// - Parameter superview: 追加するときに親ビューに指定するview. nilの場合はtoParent.viewを使用する.
    /// - Parameter animated: アニメーションの有無. viewWillAppear等の引数にも渡される. default: false
    public func addAsContainer(to toParent: UIViewController, newFrame: CGRect, superview: UIView? = nil, animated: Bool = false) {
        _move(to: toParent, newFrame: newFrame, superview: superview, animated: animated)
    }

    /// self を Container ViewController から削除する.
    ///
    /// - Parameter animated: アニメーションの有無. viewWillAppear等の引数にも渡される. default: false
    public func removeFromContainer(animated: Bool = false) {
        _move(to: nil, newFrame: nil, superview: nil, animated: animated)
    }

    /// self を Container ViewController に追加/削除する.
    ///
    /// 追加する場合は toParent, newFrame 共に **非nil** を、
    /// 削除する場合は toParent, newFrame 共に **nil** を指定する.
    ///
    /// self が別の Container ViewController の子になっている場合でも、元々の親から削除してから指定した親に追加される.
    ///
    /// - Parameter toParent: Container View Controller. 削除する場合は nil.
    /// - Parameter newFrame: self.view に設定するframe. 削除する場合は nil.
    /// - Parameter superview: 追加するときに親ビューに指定するview. nilの場合はtoParent.viewを使用する.
    /// - Parameter animated: アニメーションの有無. viewWillAppear等の引数にも渡される.
    private func _move(to toParent: UIViewController?, newFrame: CGRect?, superview: UIView?, animated: Bool) {
        assert(parent != nil || toParent != nil)
        // 表示中の画面=>表示中の画面 or 非表示中の画面=>非表示中の画面の場合はviewWillAppear等を呼ばないようにする
        let isMove = (parent?.view.window != nil) == (toParent?.view.window != nil)
        if parent != nil {
            self.willMove(toParent: nil)
            if !isMove {
                // viewWillDisappear:, viewDidDisappear: を呼ぶ
                self.beginAppearanceTransition(false, animated: animated)
                animateDisappear(animated: animated) {
                    self.view.removeFromSuperview()
                    self.endAppearanceTransition()
                    self.removeFromParent()
                }
            } else {
                self.view.removeFromSuperview()
                self.removeFromParent()
            }
        }

        assert(!(toParent != nil) || newFrame != nil, "toParent != nil なら newFrame != nil")
        assert(!(toParent == nil) || newFrame == nil, "toParent == nil なら newFrame == nil")
        assert(!(toParent == nil) || superview == nil, "toParent == nil なら superview == nil")
        if let toParent = toParent, let newFrame = newFrame {
            let superview: UIView = superview ?? toParent.view
            toParent.addChild(self)
            view.frame = newFrame
            if !isMove {
                // viewWillAppear:, viewDidAppear: を呼ぶ
                self.beginAppearanceTransition(true, animated: animated)
                superview.addSubview(self.view)
                animateAppear(animated: animated) {
                    self.endAppearanceTransition()
                    self.didMove(toParent: toParent)
                }
            } else {
                superview.addSubview(self.view)
                didMove(toParent: toParent)
            }
        }
    }

    private func animateAppear(animated: Bool, completion: @escaping () -> Void) {
        if animated {
            CATransaction.begin()
            defer { CATransaction.commit() }

            let anim = CABasicAnimation(keyPath: "opacity")
            anim.fromValue = 0.0 as Float
            anim.timingFunction = CAMediaTimingFunction(name: .linear)
            anim.duration = 0.2
            CATransaction.setCompletionBlock(completion)
            view.layer.add(anim, forKey: "opacity")
        } else {
            completion()
        }
    }

    private func animateDisappear(animated: Bool, completion: @escaping () -> Void) {
        if animated {
            CATransaction.begin()
            defer { CATransaction.commit() }

            let anim = CABasicAnimation(keyPath: "opacity")
            anim.toValue = 0.0 as Float
            anim.timingFunction = CAMediaTimingFunction(name: .linear)
            anim.duration = 0.2
            anim.isRemovedOnCompletion = false
            anim.fillMode = .forwards
            CATransaction.setCompletionBlock {
                self.view.layer.removeAnimation(forKey: "opacity")
                completion()
            }
            view.layer.add(anim, forKey: "opacity")
        } else {
            completion()
        }
    }

    /// 親を辿っていって最上位の親を返す.
    ///
    /// self が最上位の場合は self を返す.
    public var rootViewController: UIViewController {
        var rootVC: UIViewController = self
        while let parentVC = rootVC.parent {
            rootVC = parentVC
        }
        return rootVC
    }

    /// 最上位の親がAppViewControllerならそれを返す.
    public var appViewController: AppViewController? {
        return rootViewController as? AppViewController
    }

    /// モーダルを辿っていって、最前面にモーダル表示しているViewControllerを返す.
    ///
    /// self が最前面の場合は self を返す.
    public var topPresentedViewController: UIViewController {
        var vc: UIViewController = self
        while let modalVC = vc.presentedViewController {
            vc = modalVC
        }
        return vc
    }

    /// モーダルを遡っていって、最初に条件を満たすViewControllerを返す.
    ///
    /// self が条件を満たす場合は self を返す.
    /// - Parameters:
    ///   - conditionBlock: 条件ブロック. 条件を満たす場合はtrueを返す
    ///   - vc: モーダルを遡る過程で見つけたUIViewController. 最初はselfが渡される.
    /// - Returns: 最初に見つかった条件を満たすViewController.
    public func firstPresentingViewController(_ conditionBlock: (_ vc: UIViewController) -> Bool) -> UIViewController? {
        var vc: UIViewController? = self
        while let tmpVC = vc {
            if conditionBlock(tmpVC) {
                return tmpVC
            }
            vc = tmpVC.presentingViewController
        }
        return nil
    }
}
