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

// create a dictionay with the Int: count and then filter those values and return them to an array

func appearsMoreThan2(_ arr: [Int]) -> [Int] {
    var numDict = [Int: Int]() // -> this will now become a dictionary

    for num in arr {
        if let occurance = numDict[num] {
            numDict[num] = occurance + 1
        } else  {
            numDict[num] = 1
        }
    }

    var appearsMoreThanTwice = [Int]()

    for (num, occurance) in numDict {
        if occurance > 2 {
            appearsMoreThanTwice.append(num)
        }
    }

    // print(appearsMoreThanTwice)
    return appearsMoreThanTwice
}
//Call function
appearsMoreThan2(someRepeatsAgain)

//=============================================================================================================================//

// Q3. Identify if there are 3 integers in the following array that sum to 10. If so, print them. If there are multiple triplets, print all possible triplets.

var tripleSumArr = [-20,-14, -8,-5,-3,-2,1,2,3,4,9,15,20,30]



func tripletsSum3(_ numArr: [Int]) -> [[Int]] {
    var tripletSumArr = [[Int]]()
    
    for a in numArr { // O(n ^ 3)
        for b in numArr{
            for c in numArr {
                var triplet = [Int]()
                if a + b + c == 10 {
                    triplet.append(a)
                    triplet.append(b)
                    triplet.append(c)
                    tripletSumArr.append(triplet)
                }
            }
        }
    }
    
    return tripletSumArr
}

tripletsSum3(tripleSumArr)

// Q3. // again idk why

let letterValues = [
"a" : 54,
"b" : 24,
"c" : 42,
"d" : 31,
"e" : 35,
"f" : 14,
"g" : 15,
"h" : 311,
"i" : 312,
"j" : 32,
"k" : 93,
"l" : 203,
"m" : 212,
"n" : 41,
"o" : 102,
"p" : 999,
"q" : 1044,
"r" : 404,
"s" : 649,
"t" : 414,
"u" : 121,
"v" : 838,
"w" : 555,
"x" : 1001,
"y" : 123,
"z" : 432
]

// a. Sort the string below in descending order according the dictionary letterValues (decreasing)
var codeString = "aldfjaekwjnfaekjnf"

var decLetterValues = letterValues.sorted(by: {$0.value > $1.value})

var decCodeString = ""

for (letter, _) in decLetterValues {
    for char in codeString {
        if char.description == letter {
            decCodeString += char.description
        } else {
            continue
        }
    }
}

print(decCodeString)


// b. Sort the string below in ascending order according the dictionary letterValues
var codeStringTwo = "znwemnrfewpiqn"

var incLetterValues = letterValues.sorted(by: {$0.value < $1.value})

var incCodeString = ""

for (letter, _) in incLetterValues {
    for char in codeStringTwo {
        if char.description == letter {
            incCodeString += char.description
        } else {
            continue
        }
    }
}

print(incCodeString)

// Q4. Given an Array of Arrays of Ints, write a function that returns the Array of Ints with the largest sum:

var arrayOfarr = [[2,4,1],[3,0],[9,3]]

func largestArraySum(arrayOfarr: [[Int]]) -> [Int] {
    
    var largestSumArr = [Int]()
    var largestSum = 0

    for array in arrayOfarr {
        let sum = array.reduce(0, +)
        if sum > largestSum {
            largestSumArr = array
            largestSum = sum
        }
        
    }
    return largestSumArr
}

largestArraySum(arrayOfarr: arrayOfarr)

// Q5.

struct Receipt {
  let storeName: String
  let items: [ReceiptItem]

    // a. Given the structs above, add a method to Receipt that returns the total cost of all items
    
    func totalCost() -> Double {
        var total: Double = 0
        
        for item in items {
            total += item.price
        }
        return total
    }

}

struct ReceiptItem {
  let name: String
  let price: Double
}

var reciptItem1 = ReceiptItem(name: "paint", price: 5.5)
var reciptItem2 = ReceiptItem(name: "brush", price: 7.5)

var myRecipt = Receipt(storeName: "homedepot", items: [reciptItem1, reciptItem2])
var myRecipt2 = Receipt(storeName: "homedepot", items: [reciptItem1, reciptItem2])
var myRecipt3 = Receipt(storeName: "lowes", items: [reciptItem1, reciptItem2])

var arrOfRecipts = [myRecipt, myRecipt2, myRecipt3]

myRecipt.totalCost()


// b. Write a function that takes in an array of Receipts and returns an array of Receipts that match a given store name

func oneStoreRecipt(recipts: [Receipt], storeName: String) -> [Receipt]{
    var storeRecipts = [Receipt]()
    
    for recipt in recipts {
        if recipt.storeName == storeName {
            storeRecipts.append(recipt)
        }
        
    }
    return storeRecipts
}

oneStoreRecipt(recipts: arrOfRecipts, storeName: "homedepot")

// c. Write a function that takes in an array of Receipts and returns an array of those receipts sorted by price

func sortedByPrice(_ arrayOfRecipts: [Receipt]) -> [Receipt] {
    var sortedReceipts = [Receipt]()
    
    sortedReceipts = arrayOfRecipts.sorted(by: {$0.totalCost() > $1.totalCost()})
    
    return sortedReceipts
}

sortedByPrice(arrOfRecipts)

//Q6.
// a. The code below doesn't compile. Why? Fix it so that it does compile.

class Giant {
    var name: String
    var weight: Double
    var homePlanet: String // changed this from a constant to a variable so that the instance fred can be assigned a new home homeplanet property.

    init(name: String, weight: Double, homePlanet: String) {
        self.name = name
        self.weight = weight
        self.homePlanet = homePlanet
    }
}

let fred = Giant(name: "Fred", weight: 340.0, homePlanet: "Earth")

fred.name = "Brick"
fred.weight = 999.2
fred.homePlanet = "Mars"

// b. Using the Giant class. What will the value of edgar.name be after the code below runs? How about jason.name? Explain why.

let edgar = Giant(name: "Edgar", weight: 520.0, homePlanet: "Earth")
let jason = edgar
jason.name = "Jason"

// Both edgar.name and jason.name will be "Jason". this is because Giant is a class and classes are reference types. This means that since the instance jason is set equal to edgar, any changes to jason will change edgar


