import Nimble
import Quick
@testable import FileReaderTDD

class FileReader {
    func read(path: String,
              fileManager: FileManaging = FileManager.default,
              urlReader: (URL) throws -> String = String.init(contentsOf:)) throws -> String {
        guard let documentsURL = fileManager.documentsURL?.appendingPathComponent(path) else {
            fatalError()
        }

        return try urlReader(documentsURL)
    }
}

class FileReaderSpec: QuickSpec {
    override func spec() {
        describe("FileReader") {
            var sut: FileReader!

            beforeEach {
                sut = FileReader()
            }

            afterEach {
                sut = nil
            }

            describe("read") {
                var fileURL: URL!
                var fileContents: String?

                beforeEach {
                    fileURL = FileManager.default.documentsURL?.appendingPathComponent("a-021-293-121-test.txt")
                    try! "FILE CONTENTS".write(to: fileURL, atomically: true, encoding: .utf8)

                    fileContents = try? sut.read(path: "a-021-293-121-test.txt")
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
}
