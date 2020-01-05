import Nimble
import Quick

func dropPrefix(_ prefix: String, from string: String) -> String {
    return "_string"
}

class DropPrefixSpec: QuickSpec {
    override func spec() {
        describe("dropPrefix") {
            it("should drop prefix if there's one") {
                expect(dropPrefix("prefix", from: "prefix_string")) == "_string"
            }
        }
    }
}
