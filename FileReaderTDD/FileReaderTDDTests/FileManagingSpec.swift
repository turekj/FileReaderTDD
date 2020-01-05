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

                    afterEach {
                        documentsURL = nil
                    }

                    it("should return documents URL") {
                        expect(documentsURL).toNot(beNil())
                    }
                }
            }

            context("with stubbed file manager instance") {
                beforeEach {
                    sut = FileManagerStub()
                }

                describe("documents URL") {
                    var documentsURL: URL?

                    beforeEach {
                        documentsURL = sut.documentsURL
                    }

                    afterEach {
                        documentsURL = nil
                    }

                    it("should return the correct documents URL") {
                        expect(documentsURL).toNot(beNil())
                        expect(documentsURL?.absoluteString) == "/var/data/documents/"
                    }
                }
            }
        }
    }
}
