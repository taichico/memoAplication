import UIKit

class EditViewController: UIViewController, EditViewProtocol {

    public var presenter: EditViewPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
    }
    
}
