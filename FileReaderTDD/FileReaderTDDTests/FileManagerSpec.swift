import Nimble
import Quick

extension FileManager {
    var documentsURL: URL? {
        return urls(for: .documentDirectory, in: .userDomainMask).last
    }
}

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
