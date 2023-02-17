import UIKit

class TableViewController: UIViewController, TableViewProtocol {
    public var presenter: TablePresenterProtocol?
    
    let fruits = ["apple", "orange", "melon", "banana", "pineapple"]
    
    func memoTapButton() {
        
    }
    func editTapButton() {
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    @IBAction func memoButtonTapped(_ sender: Any) {
        presenter?.memoTap()
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        presenter?.editTap()
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.label.text = fruits[indexPath.row]
        return cell
    }
    
}
