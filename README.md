# KoreanDecomposer

A description of this package.

## Installation

To install this package, import `https://github.com/vanism2091/KoreanDecomposer` in SPM.

## Usage Example

```swift

let koreanCharacter = "가"

let component = KoreanDecomposer.decompose(koreanCharacter))
print(component)
//Optional(KoreanDecomposer.KoreanDecomposer.KoreanComponent(chosung: "ㄱ", jungsung: "ㅏ", jongsung: " "))

```

## References
https://lovit.github.io/nlp/2018/08/28/levenshtein_hangle/
