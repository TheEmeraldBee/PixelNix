import XCTest
import SwiftTreeSitter
import TreeSitterZel

final class TreeSitterZelTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_zel())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Zel grammar")
    }
}
