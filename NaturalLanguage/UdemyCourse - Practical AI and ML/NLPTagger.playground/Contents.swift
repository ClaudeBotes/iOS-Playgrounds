//: Playground - noun: a place where people can play

import UIKit

let inputString = "San Francisco, in northern California, is a hilly city on the tip of a peninsula surrounded by the Pacific Ocean and San Francisco Bay. It's known for its year-round fog, iconic Golden Gate Bridge, cable cars and colorful Victorian houses. The Financial District's Transamerica Pyramid is its most distinctive skyscraper. In the bay sits Alcatraz Island, site of the notorious former prison. Apple Inc."


// tag schemes: tag schemes are constants that are used to identify pieces of information that we want from the input text. Tag schemes asks tagger to look for informations like

// Token type: a contant to classify each character as a word, punctuation or a whitespace

// Language: a constant to determine langugage of the token

// LexicalClass: this constant determines class of each token. i.e. it determines part of speech for a word, type of punctuation for a punctuation or type of whitespace for a whitespace

// Name type: this constant looks for tokens that are part of a named entity. It will look for a person's name , organizational name and name of a place

// Lemma: this constant returns the stem of word.

let tagger = NSLinguisticTagger(tagSchemes: [NSLinguisticTagScheme.tokenType, .language, .lexicalClass, .nameType, .lemma], options: 0)

// Options are the way to tell API as how to split the text. We are asking to ignore any punctuations and any whitespaces. Also, if there is a named entity then join it together i.e instead of considering "San" "Francisco" as two entities, join them together as one which is "San Francisco"

let options: NSLinguisticTagger.Options = [NSLinguisticTagger.Options.omitPunctuation, .omitWhitespace, .joinNames]

// ******************************************
// Language identification
// here we will give input string to the tagger and ask the dominant language in the string.
// Dominant language is the most frequently occurring language in the string so if our string had mix of english, hindi, spanish and french words then it would choose the most common language

func languageIdentification() {
    tagger.string = inputString
    print(tagger.dominantLanguage!)
}

//languageIdentification()

// ******************************************
// Tokenization
// Its the process of splitting sentences, or paragraphs into your choice of length. Most commonly you would want to split the input string into words.

func tokenizeString() {
    tagger.string = inputString
    
    var range = NSRange(location: 0, length: inputString.utf16.count)
    
    tagger.enumerateTags(in: range, unit: NSLinguisticTaggerUnit.word, scheme: NSLinguisticTagScheme.tokenType, options: options) { (tag, tokenRange, _) in
        
        let word = (inputString as NSString).substring(with: tokenRange)
        print(word)
    }
}

//tokenizeString()

// ******************************************
// Lemmatization

// Lemmatization is the process of breaking down word into its most basic form. For example, "go" can be transformed into "gone", "will go", "went" etc and since therere are so many forms for NLP to understand it better the words are converted into their base root, like in this case all the above forms transform to "go" and this "go" is known as Lemma

func lemmatizeString() {
    tagger.string = inputString
    
    let range = NSRange(location: 0, length: inputString.utf16.count)
    
    tagger.enumerateTags(in: range, unit: NSLinguisticTaggerUnit.word, scheme: NSLinguisticTagScheme.lemma, options: options) { (tag, tokenRange, _) in
        if let lemma = tag?.rawValue {
            print(lemma)
        }
    }
}
//print("*********************************")
//lemmatizeString()

// ******************************************
// Parts of Speech

func partOfSpeech() {
    tagger.string = inputString
    let range = NSRange(location: 0, length: inputString.utf16.count)
    
    tagger.enumerateTags(in: range, unit: NSLinguisticTaggerUnit.word, scheme: NSLinguisticTagScheme.lexicalClass, options: options) { (tag, tokenRange, _) in
        if let tag = tag {
            let word = (inputString as NSString).substring(with: tokenRange)
            print("\(tag.rawValue) -> \(word)")
        }
    }
}

 //partOfSpeech()

// ******************************************
// Named Entity Recognition

func namedEntity(str: String) {
    tagger.string = str
    
    let range = NSRange(location: 0, length: str.utf16.count)
    
    let tags: [NSLinguisticTag] = [NSLinguisticTag.personalName, .placeName, .organizationName]
    
    tagger.enumerateTags(in: range, unit: NSLinguisticTaggerUnit.word, scheme: NSLinguisticTagScheme.nameType, options: options) { (tag, tokenRange, _) in
        
        if let tag = tag, tags.contains(tag) {
            let name = (str as NSString).substring(with: tokenRange)
            print("\(name) : \(tag.rawValue)")
        }
        
    }
}

namedEntity(str: inputString)










