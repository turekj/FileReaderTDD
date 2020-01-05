import Nimble
import Quick
@testable import FileReaderTDD

class FileReader {
    init(fileManager: FileManaging,
         urlReader: @escaping (URL) throws -> String) {
        self.fileManager = fileManager
        self.urlReader = urlReader
    }

    func read(path: String) throws -> String {
        guard let documentsURL = fileManager.documentsURL?.appendingPathComponent(path) else {
            fatalError()
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

enum FileReaderError: Equatable, Error {
    case missingFile(path: String)
}

class FileReaderSpec: QuickSpec {
    override func spec() {
        describe("FileReader") {
            var fileManager: FileManagerStub!
            var sut: FileReader!

            beforeEach {
                fileManager = FileManagerStub()

                let files: [String: String] = [
                    "/var/data/documents/a-021-293-121-test.txt": "FILE CONTENTS"
                ]

                sut = FileReader(
                    fileManager: fileManager,
                    urlReader: URLReaderStubFactory.make(files)
                )
            }

            afterEach {
                fileManager = nil
                sut = nil
            }

            describe("read") {
                var fileContents: String?

                afterEach {
                    fileContents = nil
                }

                context("with existing file") {
                    beforeEach {
                        fileContents = try? sut.read(path: "a-021-293-121-test.txt")
                    }

                    it("should return content read from a file") {
                        expect(fileContents).toNot(beNil())
                        expect(fileContents) == "FILE CONTENTS"
                    }
                }

                context("with non-existing file") {
                    it("should throw FileReaderError.missingFile error") {
                        expect { _ = try sut.read(path: "non-existing-file.txt") }
                            .to(throwError(FileReaderError.missingFile(path: "/var/data/documents/non-existing-file.txt")))
                    }
                }
            }
        }
    }
}
