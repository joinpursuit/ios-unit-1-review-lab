import UIKit

var str = "Hello, playground"
// Q1: Given the following excerpt from the Declaration of Independence, find the most frequent word that is longer than 5 characters.
// use .components(separatedBy:) to break up the string into an array.
// use CharacterSet.punctuationCharacters in union with any other characters you don't want in your array, like spaces and new lines.

let declarationOfIndependence =

"""
When in the Course of human events, it becomes necessary for one people to dissolve the
political bands which have connected them with another, and to assume among the powers of the
earth, the separate and equal station to which the Laws of Nature and of Nature's God entitle
them, a decent respect to the opinions of mankind requires that they should declare the causes
which impel them to the separation.
We hold these truths to be self-evident, that all men are created equal, that they are endowed by
their Creator with certain unalienable Rights, that among these are Life, Liberty and the pursuit
of Happiness. That to secure these rights, Governments are instituted among Men, deriving
their just powers from the consent of the governed, That whenever any Form of Government
becomes destructive of these ends, it is the Right of the People to alter or to abolish it, and to
institute new Government, laying its foundation on such principles and organizing its powers in
such form, as to them shall seem most likely to effect their Safety and Happiness. Prudence,
indeed, will dictate that Governments long established should not be changed for light and
transient causes; and accordingly all experience hath shewn, that mankind are more disposed to
suffer, while evils are sufferable, than to right themselves by abolishing the forms to which they
are accustomed. But when a long train of abuses and usurpations, pursuing invariably the same
Object evinces a design to reduce them under absolute Despotism, it is their right, it is their duty,
to throw off such Government, and to provide new Guards for their future security. Such has
been the patient sufferance of these Colonies; and such is now the necessity which constrains
them to alter their former Systems of Government. The history of the present King of Great
Britain is a history of repeated injuries and usurpations, all having in direct object the
establishment of an absolute Tyranny over these States. To prove this, let Facts be submitted to a
candid world.
"""

let highestValue: Int
var mostFreqWord: String = "word"
var counter: Int = 0 // will keep track of number of times word is found
var wordsDict = [String: Int]()

var noPuncString = declarationOfIndependence.filter {!$0.isPunctuation} // issue: when also filtering new line here the \n are being removed and not repaced with spaces leading to combined words
var noNewLineStr = noPuncString.replacingOccurrences(of: "\n", with: " ") // removed \n and replaced it with space to solve above problem
var strArray = noNewLineStr.components(separatedBy: " ") // creats an array of the words
var greaterThanFive = strArray.filter {$0.count > 5} // filters words to greater than 5 length


// Plan: will create a dictionary to store the words and their occurances
// will loop through the array if the word is not found in the dictionary add to dictionary and set its counter to 1, otherwise if it is found just increment the counter and set new count to the same key (word)

// creates the dictionary:
for word in greaterThanFive {
    if wordsDict.keys.contains(word) {
        counter = 1
        wordsDict[word] = counter
    } else {
        counter += 1
        wordsDict[word] = counter
        
    }
}

// testing to check most frequent value
highestValue = wordsDict.values.max() ?? 0 // prints 41 which belongs to the word "deriving" : 41

// looping to find the word that corresponds to the most frequent value
for (word, count) in wordsDict {
    if count == highestValue {
    mostFreqWord = word
    }
}

print("The most frequent word in the provided excerpt from the Declaration of Independence is \"\(mostFreqWord)\" which occured \(highestValue) times.")
