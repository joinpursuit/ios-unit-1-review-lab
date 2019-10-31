# Unit 1 Review Lab

Before completing any of the review questions below, ensure that you have answered each question in the previous labs.

## Question 1

Given the following excerpt from the Declaration of Independence, find the most frequent word that is longer than 5 characters.

 - use components(separatedBy:) to break up the string into an array.
 - use CharacterSet.punctuationCharacters in union with any other characters you don't want in your array, like spaces and new lines.

```swift
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
```
Answer
```swift
func mostUsedWordLargerThen5(_ str: String) -> String {
    let strArr = str.split(separator: " ")
    var strDict = [String: Int]()
    var mostUsedWord = ""
    var wordCount = 0
    
    for word in strArr where word.count >= 5 {
        if strDict[String(word)] == nil {
            strDict[String(word)] = 1
        } else {
            strDict[String(word)] = (strDict[String(word)] ?? 0) + 1
        }
    }
    
    for (word, count) in strDict {
        if count > wordCount {
            mostUsedWord = word
            wordCount = count
        }
    }
    return mostUsedWord
}
```
## Question 2

Make an array that contains all elements that appear more than twice in someRepeatsAgain.


```swift
var someRepeatsAgain = [25,11,30,31,50,28,4,37,13,20,24,38,28,14,44,33,7,43,39,35,36,42,1,40,7,14,23,46,21,39,11,42,12,38,41,48,20,23,29,24,50,41,38,23,11,30,50,13,13,16,10,8,3,43,10,20,28,39,24,36,21,13,40,25,37,39,31,4,46,20,38,2,7,11,11,41,45,9,49,31,38,23,41,16,49,29,14,6,6,11,5,39,13,17,43,1,1,15,25]
```
Answer
```swift
func duplicateNumbers(_ numArr: [Int]) -> Set<Int> {
    var duplicateNum = Set<Int>()
    var numSeenOnce = Set<Int>()
    
    for num in numArr {
        if numSeenOnce.contains(num) {
            duplicateNum.insert(num)
        } else {
            numSeenOnce.insert(num)
        }
    }
    
    return duplicateNum
}
```
## Question 3

Identify if there are 3 integers in the following array that sum to 10. If so, print them. If there are multiple triplets, print all possible triplets.

```swift
var tripleSumArr = [-20,-14, -8,-5,-3,-2,1,2,3,4,9,15,20,30]
```
Answer
```swift
func threeSum(_ nums: [Int], _ target: Int) {
    var numberList:Set<Set<Int >> = Set()

    for num1 in nums {
        for num2 in nums where num2 != num1 {
            for num3 in nums where num3 != num1 && num3 != num2 {
                if target == num1 + num2 + num3 && !numberList.contains([num1, num2, num3]) {
                    print([num1, num2, num3])
                    numberList.insert([num1, num2, num3])
                }
            }
        }
    }
}
```

## Question 3

```swift
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
```

a. Sort the string below in descending order according the dictionary letterValues
var codeString = "aldfjaekwjnfaekjnf"

Answer
```swift
func sortByDict(dict: [String: Int], str: String) {
    let numberValues = [
        54 : "a", 24 : "b", 42 : "c", 31 : "d", 35 : "e", 14 : "f", 15 : "g", 311 : "h", 312 : "i", 32 : "j", 93 : "k", 203 : "l", 212 : "m", 41 : "n", 102 : "o", 999 : "p", 1044 : "q", 404 : "r", 649 : "s", 414 : "t", 121 : "u", 838 : "v", 555 : "w", 1001 : "x", 123 : "y", 432 : "z"
    ]
    var numArr = [Int]()
    var result = ""
    for char in str {
        let num = dict[String(char)] ?? 0
        numArr.append(num)
    }
    numArr = numArr.sorted(by: >)
    for num in numArr {
        let char = numberValues[num] ?? ""
        result += char
    }
    
    print(result)
}
```
b. Sort the string below in ascending order according the dictionary letterValues
var codeStringTwo = "znwemnrfewpiqn"

Answer
```swift
func sortByDict(dict: [String: Int], str: String) {
    let numberValues = [
        54 : "a", 24 : "b", 42 : "c", 31 : "d", 35 : "e", 14 : "f", 15 : "g", 311 : "h", 312 : "i", 32 : "j", 93 : "k", 203 : "l", 212 : "m", 41 : "n", 102 : "o", 999 : "p", 1044 : "q", 404 : "r", 649 : "s", 414 : "t", 121 : "u", 838 : "v", 555 : "w", 1001 : "x", 123 : "y", 432 : "z"
    ]
    var numArr = [Int]()
    var result = ""
    for char in str {
        let num = dict[String(char)] ?? 0
        numArr.append(num)
    }
    numArr = numArr.sorted(by: <)
    for num in numArr {
        let char = numberValues[num] ?? ""
        result += char
    }
    
    print(result)
}
```
## Question 4

Given an Array of Arrays of Ints, write a function that returns the Array of Ints with the largest sum:


```swift
Input: [[2,4,1],[3,0],[9,3]]

Output: [9,3]
```
Answer
```swift
func largestSumOfArr(_ arrOfArr: [[Int]]) -> [Int] {
    var largestSum = 0
    var largestSumArr = [Int]()
    
    for intArr in arrOfArr {
        let sumNumer = intArr.reduce(0, { $0 + $1 })
        if sumNumer > largestSum {
            largestSum = sumNumer
            largestSumArr = intArr
        }
    }
    
    return largestSumArr
}
```

## Question 5

```swift
struct Receipt {
  let storeName: String
  let items: [ReceiptItem]
}

struct ReceiptItem {
  let name: String
  let price: Double
}
```

a. Given the structs above, add a method to `Receipt` that returns the total cost of all items

Answer
```swift
struct Receipt {
    let storeName: String
    let items: [ReceiptItem]
    
    func totalCost() -> Double {
        var total: Double = 0
        
        for cost in self.items {
            total += cost.price
        }
        
        return total
    }
}
```
b. Write a function that takes in an array of `Receipts` and returns an array of `Receipts` that match a given store name

Answer
```swift
func storeMatch(receipts: [Receipt], storeName: String) -> [Receipt] {
    var matchedStore = [Receipt]()
    
    for receipt in receipts {
        if receipt.storeName == storeName {
            matchedStore.append(receipt)
        }
    }
    
    return matchedStore
}
```
c. Write a function that takes in an array of `Receipts` and returns an array of those receipts sorted by price

Answer
```swift
func storeMatch(receipts: [Receipt]) -> [Double] {
    var priceList = [Double]()
    
    for receipt in receipts {
        priceList.append(receipt.totalCost())
    }
    
    return priceList
}
```
## Question 6

a. The code below doesn't compile.  Why?  Fix it so that it does compile.

```swift
class Giant {
    var name: String
    var weight: Double
    var homePlanet: String

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
```

b. Using the Giant class. What will the value of `edgar.name` be after the code below runs? How about `jason.name`? Explain why.

```swift
let edgar = Giant(name: "Edgar", weight: 520.0, homePlanet: "Earth")
let jason = edgar
jason.name = "Jason"
```
Answer
```swift
edger's name is going to change to "Jason" since this Giant object is made out of class and jason is refrencing to edgar. (when you refrence to a variable using a class and change the property on it it's going to change the original value)
jason,name will be Jason because of the above reason
```
## Question 7

```
struct BankAccount {
    var owner: String
    var balance: Double

    func deposit(_ amount: Double) {
        balance += amount
    }

    func withdraw(_ amount: Double) {
        balance -= amount
    }
}
```

a. Explain why the code above doesn't compile, then fix it.

Answer
```swift
inorder to mutate the property in struct you have to call the function my saying "mutating func"

struct BankAccount {
    var owner: String
    var balance: Double
    var deposits = [Double]()
    var withdrawers = [Double]()
    let startingBalance: Double
    
    init(owner: String, balance: Double) {
        self.owner = owner
        self.balance = balance
        startingBalance = balance
    }
    
    mutating func deposit(_ amount: Double) {
        balance += amount
        deposits.append(amount)
    }

    mutating func withdraw(_ amount: Double) {
        balance -= amount
        withdrawers.append(amount)
    }
    
    func totalGrowth() -> Double {
        return balance - startingBalance
    }
}
```
b. Add a property called `deposits` of type `[Double]` that stores all of the deposits made to the bank account

c. Add a property called `withdraws` of type `[Double]` that stores all of the withdraws made to the bank account

d. Add a property called `startingBalance`.  Have this property be set to the original balance, and don't allow anyone to change it

e. Add a method called `totalGrowth` that returns a double representing the change in the balance from the starting balance to the current balance

## Question 8

```swift
enum GameOfThronesHouse: String {
    case stark, lannister, targaryen, baratheon
}
```

a. Write a function that takes an instance of GameOfThronesHouse as input and, using a switch statement, returns the correct house words.

```
House Baratheon - Ours is the Fury

House Stark - Winter is coming

House Targaryen - Fire and Blood

House Lannister - A Lannister always pays his debts
```
Answer
```swift
enum GameOfThronesHouse: String {
    case stark, lannister, targaryen, baratheon
    
    func houseWords() -> String {
        switch self {
        case .stark:
            return "Winter is coming"
        case .lannister:
            return "A Lannister always pays his debts"
        case .targaryen:
            return "Fire and Blood"
        case .baratheon:
            return "Ours is the Fury"
        }
    }
}
```
b. Move that function to inside the enum as a method

## Question 9

What are the contents of `library1` and `library2`? Explain why.

```swift
class MusicLibrary {
    var tracks: [String]

    init() {
        tracks = []
    }

    func add(track: String) {
        tracks.append(track)
    }
}

let library1 = MusicLibrary()
library1.add(track: "Michelle")
library1.add(track: "Voodoo Child")
let library2 = library
library2.add(track: "Come As You Are")
```
Answer
```swift
the contents of library1 is: [Michelle, Voodoo Child] but the code is not going to complile since library2 is equal to library(witch doesn't exist). if it said library1 there the contents of library1 and 2 will be + the [Come As You Are] since library2 is refrencing to library1 and changing the original value(it will be separated if the object was created with struct)
```
## Question 10

Make a function that takes in an array of strings and returns an array of strings. The function should determine if the string can be typed out using just one row on the keyboard. If the string can be typed out using just one row, that string should be in the returned array.  

```
Input: ["Hello", "Alaska", "Dad", "Peace", "Power"]

Output: ["Alaska", "Dad", "Power"]
```
Answer
```swift
func oneRowWord(strArr: [String]) -> [String] {
    let firstRow: Set<Character> = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
    let secondRow: Set<Character> = ["a", "s", "d", "f", "g", "h", "j", "k", "l"]
    let thirdRow: Set<Character> = ["z", "x", "c", "v", "b", "n", "m"]
    var wordWithinOneRow = [String]()
    
    for word in strArr {
        let wordArr = Set(word.lowercased())
        print(wordArr)
        if firstRow.isSuperset(of: wordArr) || secondRow.isSuperset(of: wordArr) || thirdRow.isSuperset(of: wordArr){
            wordWithinOneRow.append(word)
            print(wordArr)
        }
    }
    
    return wordWithinOneRow
}
```
