import Nimble
import Quick
import XCTest
@testable import FileReaderTDD

func fileReader(path: String) -> String? {
    return ""
}

class FileReaderSpec: QuickSpec {
    override func spec() {
        describe("fileReader") {
            var fileContents: String?

            beforeEach {
                fileContents = fileReader(path: "a-021-293-121-test.txt")
            }

            afterEach {
                fileContents = nil
            }

            it("should return content read from a file") {
                expect(fileContents).toNot(beNil())
            }
        }
    }
}
