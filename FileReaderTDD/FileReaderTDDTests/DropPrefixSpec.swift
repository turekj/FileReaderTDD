import Nimble
import Quick

func dropPrefix(_ prefix: String, from string: String) -> String {
    guard string.hasPrefix(prefix) else {
        return string
    }

    return String(string.dropFirst(prefix.count))
}

class DropPrefixSpec: QuickSpec {
    override func spec() {
        describe("dropPrefix") {
            it("should drop prefix if there's one") {
                expect(dropPrefix("prefix", from: "prefix_string")) == "_string"
            }

            it("should NOT drop prefix if there's none") {
                expect(dropPrefix("not_a_prefix", from: "some_string")) == "some_string"
            }
        }
    }
}
