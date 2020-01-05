import Foundation
@testable import FileReaderTDD

class FileManagerStub: FileManaging {
    var stubbedDocumentsURLs: [URL] = [
        URL(string: "/var/data/derived")!,
        URL(string: "/var/data/documents")!,
    ]

    func urls(for directory: FileManager.SearchPathDirectory,
              in domainMask: FileManager.SearchPathDomainMask) -> [URL] {
        guard directory == .documentDirectory && domainMask == .userDomainMask else {
            return []
        }

        return stubbedDocumentsURLs
    }
}
