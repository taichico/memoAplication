import UIKit

class MemoViewController: UIViewController, MemoViewProtocol {

    public var presenter: MemoViewPresenter?
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        setupView()
    }
    
    
    @IBAction func saveButtontap(_ sender: Any) {
        presenter?.saveButtonTapped(str: textView.text)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        print("tototototo")
        presenter?.closeButtonTapped()
    }
    
    func close() {
        self.dismiss(animated: true, completion: nil)
    }
    

}


extension MemoViewController: UITextViewDelegate {
    private func setupView() {
        textView.backgroundColor = .gray
    }
    func textViewDidChange(_ textView: UITextView) {
        
    }
}
