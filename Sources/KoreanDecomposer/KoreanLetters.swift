//
//  KoreanLetters.swift
//  
//
//  Created by sei on 2023/08/23.
//

import Foundation

enum KoreanLetters {
    static var chosungs: [Character] {
        [
            "ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ",
            "ㅅ", "ㅆ", "ㅇ" , "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"
        ]
    }

    static var jungsungs: [Character] {
        [
            "ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ",
            "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ",
            "ㅛ", "ㅜ", "ㅝ", "ㅞ", "ㅟ", "ㅠ",
            "ㅡ", "ㅢ", "ㅣ"
        ]
    }

    static var jongsungs: [Character] {
        [
            " ", "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ",
            "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ", "ㅀ",
            "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ",
            "ㅋ", "ㅌ", "ㅍ", "ㅎ"
        ]
    }

    static var jaums: [Character] {
        [
            "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄸ", "ㄹ",
            "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ", "ㅀ", "ㅁ", "ㅂ",
            "ㅃ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"
        ]
    }

    static var moums: [Character] {
        [
            "ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ",
            "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ", "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"
        ]
    }

    enum K: UInt32 {
        case koreanBegin = 44032
        case koreanEnd = 55203
        case chosungBase = 588
        case jungsungBase = 28
        case jaumBegin = 12593
        case jaumEnd = 12622
        case moumBegin = 12623
        case moumEnd = 12643
    }
}

extension Character {
    var isKorean: Bool {
        guard let unicodeValue = UnicodeScalar(String(self))?.value else {
            return false
        }
        return ((KoreanLetters.K.koreanBegin.rawValue <= unicodeValue && unicodeValue <= KoreanLetters.K.koreanEnd.rawValue ) || isJaum || isMoum)
    }

    var unicodeValue: UInt32? {
        UnicodeScalar(String(self))?.value
    }

    var isJaum: Bool {
        guard let unicodeValue = self.unicodeValue else {
            return false
        }
        return KoreanLetters.K.jaumBegin.rawValue <= unicodeValue && unicodeValue <= KoreanLetters.K.jaumEnd.rawValue
    }

    var isMoum: Bool {
        guard let unicodeValue = self.unicodeValue else {
            return false
        }
        return KoreanLetters.K.moumBegin.rawValue <= unicodeValue && unicodeValue <= KoreanLetters.K.moumEnd.rawValue
    }

    static var space: Character { " " }
}
