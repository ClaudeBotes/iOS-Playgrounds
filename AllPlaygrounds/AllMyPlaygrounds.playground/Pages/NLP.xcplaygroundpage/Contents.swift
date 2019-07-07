//: Playground - noun: a place where people can play

import Foundation

let englishQuote = "Here's to the crazy ones. The misfits. The rebels. The troublemakers. The round pegs in the square holes. The ones who see things differently. They're not fond of rules. And they have no respect for the status quo. You can quote them, disagree with them, glorify or vilify them. About the only thing you can't do is ignore them. Because they change things. They push the human race forward. And while some may see them as the crazy ones, we see genius. Because the people who are crazy enough to think they can change the world, are the ones who do. - Steve Jobs (Founder of Apple Inc.)"

let chineseQuote = "这是疯狂的。不符合者。反叛者。麻烦制造者。圆钉在方孔。那些以不同方式看待事物的人。他们不喜欢规则。他们不尊重现状。你可以引用它们，不同意它们，美化或诋毁它们。关于你唯一不能做的就是忽略它们。因为他们改变了一切。他们推动人类向前发展。虽然有些人可能认为它们是疯狂的，但我们看到了天才。因为那些疯狂到足以让他们认为自己可以改变世界的人才能做到。 - 史蒂夫乔布斯（Apple Inc.创始人"

let dutchQuote = "Hier zijn de gekken. De buitenbeentjes. De rebellen. De herrieschoppers. De ronde pinnen in de vierkante gaten. Degenen die dingen anders zien. Ze zijn niet dol op regels. En ze hebben geen respect voor de status-quo. Je kunt ze citeren, het oneens zijn met hen, ze verheerlijken of ze belasteren. Over het enige dat je niet kunt doen, is negeren. Omdat ze dingen veranderen. Ze duwen het menselijk ras vooruit. En hoewel sommigen ze misschien als de gekken beschouwen, zien we geniaal. Omdat de mensen die gek genoeg zijn om te denken dat ze de wereld kunnen veranderen, degenen zijn die dat wel doen. - Steve Jobs (oprichter van Apple Inc.)"

/*
 The very first thing we need to do is create a tagger. In Natural Language Processing, a tagger is basically a piece of software which can read text and “tag” various information to it such as part of speech, recognize names and languages, perform lemmatization, etc. We do this by calling the NSLinguisticTagger class
 
 Token Type: A property which classifies each character as either a word, punctuation, or whitespace.
 
 Language: Determines the language of the token
 
 Lexical Class: A property which classifies each token according to its class. For example, it’ll determine the part of speech for a word, the type of punctuation for a punctuation, or the type of whitespace for a whitespace.
 
 Name Type: This property looks for tokens which are part of a named entity. It’ll look for a personal name, an organizational name, and a place name.
 
 Lemma: This basically returns the stem of a word token. I’ll be going into more detail about this later on.
 */

let tagger = NSLinguisticTagger(tagSchemes:[.tokenType,
                                            .language,
                                            .lexicalClass,
                                            .nameType,
                                            .lemma], options: 0)

let options: NSLinguisticTagger.Options = [.omitPunctuation,
                                           .omitWhitespace,
                                           .joinNames]

// Determine Language of a given string.
/**
 Determin the language for a given text. Determines the language code and language
 Example: en-English
 
 - parameters:
 - text: Text for which to establish language for.
 */
func determineLanguage(for text: String) {
    tagger.string = text
    
    guard let languageCode = tagger.dominantLanguage else {
        return
    }
    
    guard let language = Locale.current.localizedString(forIdentifier: languageCode) else {
        return
    }
    
    print("Language code found: \(languageCode) - which is the code for: \(language)")
    
}

// Tonenization

/**
 Breaks a given sentance or string into tokens of words.
 Token Type: A property which classifies each character as either a word, punctuation, or whitespace.
 
 - parameters:
 - text: Text to be tockenized
 - tagUnit: Unit by which to tickenize text
 */
func tokenizeText(for text: String, tagUnit: NSLinguisticTaggerUnit) {
    tagger.string = text
    let range = NSRange(location: 0, length: text.utf16.count)
    tagger.enumerateTags(in: range, unit: tagUnit, scheme: .tokenType, options: options) { tag, tokenRange, stop in
        let word = (text as NSString).substring(with: tokenRange)
        print(word)
    }
}

// Lemmatization

/**
 This basically returns the stem of a word token. I’ll be going into more detail about this later on.
 
 - parameters:
 - text: Text to be lemmatized
 */
func lemmatization(for text: String) {
    tagger.string = text
    let range = NSRange(location:0, length: text.utf16.count)
    tagger.enumerateTags(in: range, unit: .word, scheme: .lemma, options: options) { tag, tokenRange, stop in
        if let lemma = tag?.rawValue {
            print(lemma)
        }
    }
}

// Part of Speach
func partsOfSpeech(for text: String) {
    tagger.string = text
    let range = NSRange(location: 0, length: text.utf16.count)
    tagger.enumerateTags(in: range, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange, _ in
        if let tag = tag {
            let word = (text as NSString).substring(with: tokenRange)
            print("\(word): \(tag.rawValue)")
        }
    }
}

// Named Entity Recognition
func namedEntityRecognition(for text: String) {
    tagger.string = text
    let range = NSRange(location: 0, length: text.utf16.count)
    let tags: [NSLinguisticTag] = [.personalName, .placeName, .organizationName]
    tagger.enumerateTags(in: range, unit: .word, scheme: .nameType, options: options) { tag, tokenRange, stop in
        if let tag = tag, tags.contains(tag) {
            let name = (text as NSString).substring(with: tokenRange)
            print("\(name): \(tag.rawValue)")
        }
    }
}

// Testing diff methods

//determineLanguage(for: englishQuote)
//determineLanguage(for: chineseQuote)
//determineLanguage(for: dutchQuote)

//tokenizeText(for: englishQuote, tagUnit: .word)

lemmatization(for: englishQuote)
//
//partsOfSpeech(for: englishQuote)
//namedEntityRecognition(for: dutchQuote)

