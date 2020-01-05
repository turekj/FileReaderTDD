import Foundation

class URLReaderStubFactory {
    static func make(_ files: [String: String], _ prefix: URL?) -> (URL) throws -> String {
        return { url in
            let stringPrefix = prefix?.absoluteString ?? ""
            let urlString = dropPrefix(stringPrefix, from: url.absoluteString)

            guard let fileContents = files[urlString] else {
                throw NSError(domain: "URLReaderError", code: 404, userInfo: nil)
            }

            return fileContents
        }
    }
}
