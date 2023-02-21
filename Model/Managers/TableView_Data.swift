public class TableViewData: TableViewDataProtocol {

    public static let shared = TableViewData()
    var str: String = "hoge"

    func tableData(text: String) {
        str = text
    }
}
