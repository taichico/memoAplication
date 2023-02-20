import UIKit

class TableViewController: UIViewController, TableViewProtocol {
    public var presenter: TablePresenterProtocol?
    
    var readFile: String = ""
    var items: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
        items = readFile.components(separatedBy: "\n")
        print("readFIle", readFile)
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
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.label.text = items[indexPath.row]
        return cell
    }
    
}
