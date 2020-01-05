import Nimble
import Quick
@testable import FileReaderTDD

class FileManagingSpec: QuickSpec {
    override func spec() {
        describe("FileManaging") {
            var sut: FileManaging!

            afterEach {
                sut = nil
            }

            context("with real file manager instance") {
                beforeEach {
                    sut = FileManager.default
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
}
