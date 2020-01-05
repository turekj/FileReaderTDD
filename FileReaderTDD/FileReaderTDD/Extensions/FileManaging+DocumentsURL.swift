import Foundation

extension FileManaging {
    var documentsURL: URL? {
        return urls(for: .documentDirectory, in: .userDomainMask).last
    }
}
