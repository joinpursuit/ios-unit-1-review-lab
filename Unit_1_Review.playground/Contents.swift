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


func mostFrequentWord(_ str: String) -> String {
    let punctuationAndLines = CharacterSet.punctuationCharacters.union(CharacterSet.whitespacesAndNewlines) // creates a character set with punc, spaces and new lines
    let stringArray = str.lowercased().components(separatedBy: punctuationAndLines).filter({$0.count > 5})
    var wordDict = [String: Int]()
    
    //populating the dictionary:
    for word in stringArray {
        if let count = wordDict[word] {
            wordDict[word] = count + 1
        } else {
             wordDict[word] = 1
        }
    }
    
    let highestValue = wordDict.values.max() ?? 0
    var mostFreqword = ""
    
    for (word, _) in wordDict {
        if wordDict[word] == highestValue {
            mostFreqword = word
        }
    }
    
    

    return mostFreqword
}

mostFrequentWord(declarationOfIndependence) // returns government

//=============================================================================================================================//

// Q2: Make an array that contains all elements that appear more than twice in someRepeatsAgain.

var someRepeatsAgain = [25,11,30,31,50,28,4,37,13,20,24,38,28,14,44,33,7,43,39,35,36,42,1,40,7,14,23,46,21,39,11,42,12,38,41,48,20,23,29,24,50,41,38,23,11,30,50,13,13,16,10,8,3,43,10,20,28,39,24,36,21,13,40,25,37,39,31,4,46,20,38,2,7,11,11,41,45,9,49,31,38,23,41,16,49,29,14,6,6,11,5,39,13,17,43,1,1,15,25]

//loop through the array and append to another array all the ints that appear once. and if they are found again (by comparing to the new array) append them to another array that holds the nums that appear more than twice
var appearsOnce = [Int]()
var appearsTwice = [Int]()

someRepeatsAgain.count

for num in someRepeatsAgain {
    if appearsOnce.contains(num) {
        appearsTwice.append(num)
    } else if !appearsTwice.contains(num) {
        appearsOnce.append(num)
    }
}

// print(appearsTwice) // list of arrays that appear twice not more than twice NOT WHAT IS ASKED FOR****

// create a dictionay with the Int: count and then filter those values and return them to an array

var numDict = [Int: Int]() // -> this will now become a dictionary
var count = 0

for num in someRepeatsAgain {
    if numDict.keys.contains(num) {
        count += 1
        numDict[num] = count
    } else  {
        numDict[num] = 1
        // appearsOnce.append(num)
    }
}

print(numDict)
