import Nimble
import Quick
@testable import FileReaderTDD

class FileReaderSpec: QuickSpec {
    override func spec() {
        describe("FileReader") {
            var fileManager: FileManagerStub!
            var sut: FileReader!

            beforeEach {
                fileManager = FileManagerStub()

                let files: [String: String] = [
                    "a-021-293-121-test.txt": "FILE CONTENTS"
                ]

                sut = FileReader(
                    fileManager: fileManager,
                    urlReader: URLReaderStubFactory.make(files, fileManager.documentsURL)
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

                context("with file manager unable to resolve documents URL") {
                    beforeEach {
                        fileManager.stubbedDocumentsURLs = []
                    }

                    it("should throw FileReaderError.missingDocumentsURL error") {
                        expect { _ = try sut.read(path: "non-existing-file.txt") }
                            .to(throwError(FileReaderError.missingDocumentsURL))
                    }
                }
            }
        }
    }
}
