import UIKit

class ShowMemoViewController: UIViewController, ShowMemoViewProtocol, UIGestureRecognizerDelegate {

    public var presenter: EditViewPresenter?
    @IBOutlet weak var textLabel: UILabel!
    var text = ""

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
        textLabel.text = text
    }

    @IBAction func closeButtonTapped(_ sender: Any) {
        presenter?.closeButtonTapped()
    }
    
    func closeButtonTapped() {
        self.dismiss(animated: true)
    }
}
