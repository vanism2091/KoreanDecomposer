import XCTest
@testable import KoreanDecomposer

final class KoreanDecomposerTests: XCTestCase {

    func test_isKorean_초성() throws {
        for chosung in KoreanLetters.chosungs {
            XCTAssertEqual(chosung.isKorean, true)
        }
    }

    func test_isKorean_중성() throws {
        for jungsung in KoreanLetters.jungsungs {
            XCTAssertEqual(jungsung.isKorean, true)
        }
    }

    func test_isKorean_종성() throws {
        for jongsung in KoreanLetters.jongsungs[1...] {
            XCTAssertEqual(jongsung.isKorean, true)
        }
    }

    func test_isKorean_한국어() throws {
        let testString = "테스트를위한한국어"
        for character in testString {
            XCTAssertEqual(character.isKorean, true)
        }
    }

    func test_isJaum_true() throws {
        for jaum in KoreanLetters.jaums {
            XCTAssertEqual(jaum.isJaum, true)
        }
    }

    func test_isJaum_false() throws {
        for moum in KoreanLetters.moums {
            XCTAssertEqual(moum.isJaum, false)
        }
    }

    func test_isMoum_true() throws {
        for moum in KoreanLetters.moums {
            XCTAssertEqual(moum.isMoum, true)
        }
    }

    func test_isMoum_false() throws {
        for jaum in KoreanLetters.jaums {
            XCTAssertEqual(jaum.isMoum, false)
        }
    }

    func test_decompose_초중종() throws {
        XCTAssertEqual(KoreanDecomposer.decompose("강"), KoreanDecomposer.KoreanComponent(chosung: "ㄱ", jungsung: "ㅏ", jongsung: "ㅇ"))
    }

    func test_decompose_초중() throws {
        XCTAssertEqual(KoreanDecomposer.decompose("가"), KoreanDecomposer.KoreanComponent(chosung: "ㄱ", jungsung: "ㅏ", jongsung: " "))
    }

    func test_decompose_초() throws {
        XCTAssertEqual(KoreanDecomposer.decompose("ㄱ"), KoreanDecomposer.KoreanComponent(chosung: "ㄱ", jungsung: " ", jongsung: " "))
    }

    func test_decompose_중() throws {
        XCTAssertEqual(KoreanDecomposer.decompose("ㅏ"), KoreanDecomposer.KoreanComponent(chosung: " ", jungsung: "ㅏ", jongsung: " "))
    }

    func test_decompose_nil() throws {
        XCTAssertEqual(KoreanDecomposer.decompose(" "), nil)
    }


    func test_decomposeV2_초중종() throws {
        XCTAssertEqual(KoreanDecomposer.decomposeV2("강"), KoreanDecomposer.KoreanComponent(chosung: "ㄱ", jungsung: "ㅏ", jongsung: "ㅇ"))
    }

    func test_decomposeV2_초중() throws {
        XCTAssertEqual(KoreanDecomposer.decomposeV2("가"), KoreanDecomposer.KoreanComponent(chosung: "ㄱ", jungsung: "ㅏ", jongsung: " "))
    }

    func test_decomposeV2_초() throws {
        XCTAssertEqual(KoreanDecomposer.decomposeV2("ㄱ"), KoreanDecomposer.KoreanComponent(chosung: "ㄱ", jungsung: " ", jongsung: " "))
    }

    func test_decomposeV2_중() throws {
        XCTAssertEqual(KoreanDecomposer.decomposeV2("ㅏ"), KoreanDecomposer.KoreanComponent(chosung: " ", jungsung: "ㅏ", jongsung: " "))
    }

    func test_decomposeV2_nil() throws {
        XCTAssertEqual(KoreanDecomposer.decomposeV2(" "), nil)
    }
}
