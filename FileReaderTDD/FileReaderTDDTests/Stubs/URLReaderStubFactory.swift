import Foundation

class URLReaderStubFactory {
    static func make(_ files: [String: String]) -> (URL) throws -> String {
        return { url in
            guard let fileContents = files[url.absoluteString] else {
                fatalError()
            }

            return fileContents
        }
    }
}
