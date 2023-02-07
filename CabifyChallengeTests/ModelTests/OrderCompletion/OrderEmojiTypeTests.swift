//
//  OrderEmojiTypeTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 07.02.2023.
//

import XCTest
@testable import CabifyChallenge

final class OrderEmojiTypeTests: XCTestCase {
    func testDefaultEmojiRepresentation() {
        let voucher: OrderEmojiType = .voucher
        let tShirt: OrderEmojiType = .tShirt
        let mug: OrderEmojiType = .mug
        
        XCTAssertEqual(voucher.emoji, "🎫")
        XCTAssertEqual(tShirt.emoji, "👚")
        XCTAssertEqual(mug.emoji, "☕️")
    }
    
    func testEmojiRepresentationFromRawValue() {
        let voucher = OrderEmojiType(rawValue: "VOUCHER")
        let tShirt = OrderEmojiType(rawValue: "TSHIRT")
        let mug = OrderEmojiType(rawValue: "MUG")
        
        XCTAssertNotNil(voucher?.emoji)
        XCTAssertNotNil(tShirt?.emoji)
        XCTAssertNotNil(mug?.emoji)
        
        XCTAssertEqual(voucher?.emoji, "🎫")
        XCTAssertEqual(tShirt?.emoji, "👚")
        XCTAssertEqual(mug?.emoji, "☕️")
    }
}
