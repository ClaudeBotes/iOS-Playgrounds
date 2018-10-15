//: Playground - noun: a place where people can play

import UIKit

typealias TaggedToken = (String, String?)

func tag(text: String, scheme: String) -> [TaggedToken] {
    let options: NSLinguisticTagger.Options = [.omitWhitespace, .omitPunctuation, .omitOther]
    let tagger = NSLinguisticTagger(tagSchemes: NSLinguisticTagger.availableTagSchemes(forLanguage: "en"),
                                    options: Int(options.rawValue))
    tagger.string = text
    
    var tokens: [TaggedToken] = []
    
    // Using NSLinguisticTagger
    tagger.enumerateTags(in: NSMakeRange(0, text.count), scheme:NSLinguisticTagScheme(rawValue: scheme), options: options) { tag, tokenRange, _, _ in
        let token = (text as NSString).substring(with: tokenRange)
        tokens.append((token, tag.map { $0.rawValue }))
    }
    return tokens
}

// Implementation

func partOfSpeech(text: String) -> [TaggedToken] {
    return tag(text: text, scheme:NSLinguisticTagScheme.lexicalClass.rawValue)
}

func lemmatize(text: String) -> [TaggedToken] {
    return tag(text: text, scheme: NSLinguisticTagScheme.lemma.rawValue)
}

func language(text: String) -> [TaggedToken] {
    return tag(text: text, scheme: NSLinguisticTagScheme.language.rawValue)
}

// Try them out
partOfSpeech(text: "Tutor at work yesterday at 2pm until yesterday at 6pm.")
lemmatize(text: "I went to the store")
language(text: "My name is Claude")


var testString : NSString = "You may call my number at +6016-337-3081, or visit irekasoft.com, irekasoft.com/blog by next monday at San Jose, California on 1 pm"

let types : NSTextCheckingResult.CheckingType = [.address , .date, .phoneNumber, .link ]
let dataDetector = try? NSDataDetector(types: types.rawValue)

dataDetector?.enumerateMatches(in: testString as String, options: [], range: NSMakeRange(0,testString.length), using: { (match, flags, _) in
    
    let matchString = testString.substring(with: (match?.range)!)
    
    if match?.resultType == .date {
        
        print("date: \(matchString)")
        
    }else if match?.resultType == .phoneNumber {
        
        print("phoneNumber: \(matchString)")
        
        
    }else if match?.resultType == .address {
        
        print("address: \(matchString)")
        
        
    }else if match?.resultType == .link {
        
        print("link: \(matchString)")
        
        
    }else{
        print("else \(matchString)")
    }
    
})

