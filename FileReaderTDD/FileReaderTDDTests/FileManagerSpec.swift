import Nimble
import Quick
@testable import FileReaderTDD

class FileManagerSpec: QuickSpec {
    override func spec() {
        describe("FileManager") {
            var sut: FileManager!

            beforeEach {
                sut = .default
            }

            afterEach {
                sut = nil
            }

            describe("documents URL") {
                var documentsURL: URL?

                beforeEach {
                    documentsURL = sut.documentsURL
                }

                it("should return documents URL") {
                    expect(documentsURL).toNot(beNil())
                }
            }
        }
    }
}
