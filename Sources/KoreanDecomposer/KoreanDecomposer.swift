public enum KoreanDecomposer {
    public struct KoreanComponent: Equatable {
        let chosung: Character
        let jungsung: Character
        let jongsung: Character

        public var asArray: [Character] {
            [chosung, jungsung, jongsung]
        }
    }

    public static func decompose(_ character: Character) -> KoreanComponent? {
        guard character.isKorean else {
            return nil
        }

        // 자음인 경우
        if character.isJaum {
            return KoreanComponent(
                chosung: character,
                jungsung: .space,
                jongsung: .space
            )
        }

        // 모음인 경우
        if character.isMoum {
            return KoreanComponent(
                chosung: .space,
                jungsung: character,
                jongsung: .space
            )
        }

        guard let unicodeValue = character.unicodeValue else {
            return nil
        }

        // decomposition rule

        let indexOf = getIndex(with: unicodeValue)

        return KoreanComponent(
            chosung: KoreanLetters.chosungs[indexOf.chosung],
            jungsung: KoreanLetters.jungsungs[indexOf.jungsung],
            jongsung: KoreanLetters.jongsungs[indexOf.jongsung]
        )
    }

    public static func decomposeV2(_ character: Character) -> KoreanComponent? {
        switch true {
        case character.isJaum:
            return KoreanComponent(
                chosung: character,
                jungsung: .space,
                jongsung: .space
            )
        case character.isMoum:
            return KoreanComponent(
                chosung: .space,
                jungsung: character,
                jongsung: .space
            )
        case character.isKorean:
            guard let unicodeValue = character.unicodeValue else {
                return nil
            }

            let indexOf = getIndex(with: unicodeValue)

            return KoreanComponent(
                chosung: KoreanLetters.chosungs[indexOf.chosung],
                jungsung: KoreanLetters.jungsungs[indexOf.jungsung],
                jongsung: KoreanLetters.jongsungs[indexOf.jongsung]
            )
        default:
            return nil
        }
    }

    typealias IndexOf = (chosung: Int, jungsung: Int, jongsung: Int)

    private static func getIndex(with unicodeValue: UInt32) -> IndexOf {
        let k = KoreanLetters.K.self
        var unicodeValue = unicodeValue
        unicodeValue -= k.koreanBegin.rawValue
        let chosungIndex = unicodeValue / k.chosungBase.rawValue
        let jungsungIndex = (unicodeValue - chosungIndex * k.chosungBase.rawValue) / k.jungsungBase.rawValue
        let jongsungIndex = (unicodeValue - chosungIndex * k.chosungBase.rawValue - jungsungIndex * k.jungsungBase.rawValue)
        return (Int(chosungIndex), Int(jungsungIndex), Int(jongsungIndex))
    }
}
