import Foundation

// 入力
protocol SamplePresenterInput: AnyObject {
    func tapEdit()
    func tapMemo()
}
// 出力
protocol SamplePresenterOutput: AnyObject {
    func printMemo()
    func printEdit()
}
