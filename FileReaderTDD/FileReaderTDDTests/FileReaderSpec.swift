import Nimble
import Quick
import XCTest
@testable import FileReaderTDD

func fileReader(path: String) -> String? {
    return "FILE CONTENTS"
}

class FileReaderSpec: QuickSpec {
    override func spec() {
        describe("fileReader") {
            var documentsURL: URL?
            var fileContents: String?

            beforeEach {
                documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
                fileContents = fileReader(path: "a-021-293-121-test.txt")
            }

            afterEach {
                fileContents = nil
            }

            it("should return documents URL") {
                expect(documentsURL).toNot(beNil())
            }

            it("should return content read from a file") {
                expect(fileContents).toNot(beNil())
                expect(fileContents) == "FILE CONTENTS"
            }
        }
    }
}
