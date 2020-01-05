import Nimble
import Quick

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
                    documentsURL = sut.urls(for: .documentDirectory, in: .userDomainMask).last
                }

                it("should return documents URL") {
                    expect(documentsURL).toNot(beNil())
                }
            }
        }
    }
}
