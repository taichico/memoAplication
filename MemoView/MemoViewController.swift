import UIKit

class MemoViewController: UIViewController, MemoViewProtocol {

    public var presenter: MemoViewPresenter?
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
    }
    
    
    @IBAction func saveButtontap(_ sender: Any) {
        
    }
}
