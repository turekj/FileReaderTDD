import Nimble
import Quick
@testable import FileReaderTDD

func fileReader(path: String, fileManager: FileManager = .default) throws -> String {
    guard let documentsURL = fileManager.documentsURL?.appendingPathComponent(path) else {
        fatalError()
    }

    return try String(contentsOf: documentsURL)
}

class FileReaderSpec: QuickSpec {
    override func spec() {
        describe("fileReader") {
            var fileURL: URL!
            var fileContents: String?

            beforeEach {
                fileURL = FileManager.default.documentsURL?.appendingPathComponent("a-021-293-121-test.txt")
                try! "FILE CONTENTS".write(to: fileURL, atomically: true, encoding: .utf8)

                fileContents = try? fileReader(path: "a-021-293-121-test.txt")
            }

            afterEach {
                try! FileManager.default.removeItem(at: fileURL)
                fileURL = nil
                fileContents = nil
            }

            it("should return content read from a file") {
                expect(fileContents).toNot(beNil())
                expect(fileContents) == "FILE CONTENTS"
            }
        }
    }
}
