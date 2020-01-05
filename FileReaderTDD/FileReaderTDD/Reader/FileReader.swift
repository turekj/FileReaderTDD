import Foundation

class FileReader {
    init(fileManager: FileManaging,
         urlReader: @escaping (URL) throws -> String) {
        self.fileManager = fileManager
        self.urlReader = urlReader
    }

    func read(path: String) throws -> String {
        guard let documentsURL = fileManager.documentsURL?.appendingPathComponent(path) else {
            throw FileReaderError.missingDocumentsURL
        }

        do {
            return try urlReader(documentsURL)
        } catch {
            throw FileReaderError.missingFile(path: documentsURL.absoluteString)
        }
    }

    private let fileManager: FileManaging
    private let urlReader: (URL) throws -> String
}
