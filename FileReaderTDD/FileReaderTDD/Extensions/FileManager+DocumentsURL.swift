import Foundation

extension FileManager {
    var documentsURL: URL? {
        return urls(for: .documentDirectory, in: .userDomainMask).last
    }
}
