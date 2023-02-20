import Foundation
import UIKit

extension FileManager {
    func appendText(string: String) -> String? {
        guard let dirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError("フォルダURL取得エラー")
        }
        let fileURL = dirURL.appendingPathComponent("sample.txt")
        do {
            let fileHandle = try FileHandle(forWritingTo: fileURL)
            let stringToWrite = "\n" + string
            fileHandle.seekToEndOfFile()
            fileHandle.write(stringToWrite.data(using: String.Encoding.utf8)!)
            return stringToWrite }
        catch let error as NSError { print("Error: \(error)")
            return nil
        }
    }
    
    func readingFile() -> String? {
        guard let docURL = urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("URL取得失敗")
        }
        let fullURL = docURL.appendingPathComponent("sample.txt")
        do {
            let textData = try String(contentsOf: fullURL, encoding: .utf8)
            return textData
        } catch {
            return nil
        }
    }

    func createFile() {
        let fileManager = FileManager.default
        // String型のDocPathを作成
        let docPath =  NSHomeDirectory() + "/Documents"
        let filePath = docPath + "/sample.txt"
        if !fileManager.fileExists(atPath: filePath) {
            fileManager.createFile(atPath:filePath, contents: nil, attributes: [:]
            )
        } else {
            print("既に存在します。")
        }
    }
}
