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
```
Question 1 Answer

var filteredCharacters = CharacterSet(charactersIn: "\n ,.;:'")

var declarationArray = declarationOfIndependence.components(separatedBy: filteredCharacters)
declarationArray = declarationArray.filter{ $0.count > 5 }

var declarationDict: [String: Int] = [:]
var mostFrequentKey: String = ""
var mostFrequentInt: Int = 0

for string in declarationArray{
    if let unwrappedInt = declarationDict[string]{
        declarationDict[string] = unwrappedInt + 1
    } else {
        declarationDict[string] = 0
    }
}

for (key,value) in declarationDict{
    if value > mostFrequentInt{
        mostFrequentInt = value
        mostFrequentKey = key
    }
}

print("The most frequent word over five characters long in the string is \(mostFrequentKey), which occurs \(mostFrequentInt) times.")

```

## Question 2

Make an array that contains all elements that appear more than twice in someRepeatsAgain.


```swift
var someRepeatsAgain = [25,11,30,31,50,28,4,37,13,20,24,38,28,14,44,33,7,43,39,35,36,42,1,40,7,14,23,46,21,39,11,42,12,38,41,48,20,23,29,24,50,41,38,23,11,30,50,13,13,16,10,8,3,43,10,20,28,39,24,36,21,13,40,25,37,39,31,4,46,20,38,2,7,11,11,41,45,9,49,31,38,23,41,16,49,29,14,6,6,11,5,39,13,17,43,1,1,15,25]
```
```
Question 2 Answer 

var tempSet: Set<Int> = []
var repeatSet: Set<Int> = []
var repeatArray: [Int] = []

for int in someRepeatsAgain{
    if tempSet.contains(int){
        repeatSet.insert(int)
    } else {
        tempSet.insert(int)
    }
}

repeatArray = Array(repeatSet)
```

## Question 3

Identify if there are 3 integers in the following array that sum to 10. If so, print them. If there are multiple triplets, print all possible triplets.

```swift
var tripleSumArr = [-20,-14, -8,-5,-3,-2,1,2,3,4,9,15,20,30]
```
```
Question 3 Answer 

func equalToTen(_ tuple: (Int,Int,Int)) -> Bool {
 let sum = tuple.0 + tuple.1 + tuple.2
    if sum == 10{
        return true
    } else {
        return false
    }
}

func hasDoubles(_ tuple: (Int,Int,Int)) -> Bool {
    if tuple.0 == tuple.1 || tuple.0 == tuple.2 || tuple.1 == tuple.2{
        return true
    }
    return false
}
var tenArray: [(Int,Int,Int)] = []
var sumTuple: (Int,Int,Int) = (0,0,0)
var indexOne: Int = 0
var indexTwo: Int = 1

while indexOne < tripleSumArr.count-1{
    sumTuple.0 = tripleSumArr[indexOne]
    sumTuple.1 = tripleSumArr[indexTwo]

    for chop in tripleSumArr{
        sumTuple.2 = chop
        if equalToTen(sumTuple) && !hasDoubles(sumTuple){
            tenArray.append(sumTuple)
        }
    }
    indexTwo += 1
    if indexTwo == tripleSumArr.count{
        indexOne += 1
        indexTwo = indexOne + 1
    }
}

print(tenArray)
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

```
Question 3a Answer

var someArr: [String] = []
var intArr: [Int] = Array(letterValues.values).sorted{$0 > $1}

for int in intArr{
    for (key,value) in letterValues{
        if value == int{
            someArr.append(key)
        }
    }
}

var codeString = "aldfjaekwjnfaekjnf"
var codeArr = Array(codeString)
var outputString = ""
var repeats = false


for string in someArr{
     repeat{
        if let unwrappedIndex = codeArr.firstIndex(of: Character(string)){
            outputString = outputString + String(codeArr.remove(at: unwrappedIndex))
            repeats = true
        } else {
            repeats = false
        }
    }while repeats
}

```

b. Sort the string below in ascending order according the dictionary letterValues
var codeStringTwo = "znwemnrfewpiqn"

```
Question 3b Answer

var someArr: [String] = []
var intArr: [Int] = Array(letterValues.values).sorted{$0 < $1}

for int in intArr{
    for (key,value) in letterValues{
        if value == int{
            someArr.append(key)
        }
    }
}
var codeString = "aldfjaekwjnfaekjnf"
var codeArr = Array(codeString)
var outputString = ""
var repeats = false


for string in someArr{
     repeat{
        if let unwrappedIndex = codeArr.firstIndex(of: Character(string)){
            outputString = outputString + String(codeArr.remove(at: unwrappedIndex))
            repeats = true
        } else {
            repeats = false
        }
    }while repeats
}
```

## Question 4

Given an Array of Arrays of Ints, write a function that returns the Array of Ints with the largest sum:


```swift
Input: [[2,4,1],[3,0],[9,3]]

Output: [9,3]
```
```
Question 4 Answer

func largestSum(_ arr: [[Int]]) -> [Int]{
    var largestSum = 0
    var largestSumIndex = 0
    
    for num in 0..<arr.count{
    let tempSum = arr[num].reduce(0){ return $0 + $1 }
        if tempSum > largestSum{
            largestSum = tempSum
            largestSumIndex = num
        }
    }
    return arr[largestSumIndex]
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

```
Question 5a Answer

struct Receipt {
    let storeName: String
    let items: [ReceiptItem]
    
    func totalCost() -> Double{
        return self.items.reduce(0.0){return $0 + $1.price}
    }
}

struct ReceiptItem {
  let name: String
  let price: Double
}
```


b. Write a function that takes in an array of `Receipts` and returns an array of `Receipts` that match a given store name
```
Question 5b Answer

func matchesStoreName(_ arr: [Receipt],_ inputStore: String) -> [Receipt]{
    var returnArray: [Receipt] = []
    for item in arr{
        if item.storeName == inputStore{
            returnArray.append(item)
        }
    }
    return returnArray
}
```

c. Write a function that takes in an array of `Receipts` and returns an array of those receipts sorted by price.
```
Question 5c Answer

//Sorted by Total Cost from least to greatest

struct Receipt{
    
    let storeName: String
    let items: [ReceiptItem]
    var amountDue: Double // Total amount due
    
    init(storeName: String, items: [ReceiptItem]){
        self.storeName = storeName
        self.items = items
        self.amountDue = 0.0
    }
    
    func totalCost() -> Double{
        return self.items.reduce(0.0){return $0 + $1.price}
    }
}

struct ReceiptItem {
  let name: String
  let price: Double
}

func sortReceipts(_ arr: [Receipt]) -> [Receipt]{
    var sortedReceipts: [Receipt] = arr
    for index in 0..<arr.count{
        sortedReceipts[index].amountDue = arr[index].totalCost()
    }
    
    sortedReceipts = sortedReceipts.sorted{$0.amountDue < $1.amountDue}
    return sortedReceipts
}

```

## Question 6

a. The code below doesn't compile.  Why?  Fix it so that it does compile.

```swift
class Giant {
    var name: String
    var weight: Double
    let homePlanet: String

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

```
Question 6a Answer

The code doesn't compile because the property homePlanet is a constant, and cannot be changed after initialization. It can be fixed, by changing homePlanet to a variable.

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
```
Question 6b answer

Because classes are reference types, both edgar.name and jason.name will have a value of Jason. This is because both variables reference the same instance. 
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
```
Question 7a Answer 

The above code does not compile because structures are value types, meaning that the values of their properties are not expected to be changed by their methods. You can fix the code by prefixing the methods with the keyword mutating.

struct BankAccount {
    var owner: String
    var balance: Double

    mutating func deposit(_ amount: Double) {
        balance += amount
    }

    mutating func withdraw(_ amount: Double) {
        balance -= amount
    }
}

```

b. Add a property called `deposits` of type `[Double]` that stores all of the deposits made to the bank account
```
Question 7b Answer

struct BankAccount {
    var owner: String
    var balance: Double
    var deposits: [Double]

    mutating func deposit(_ amount: Double) {
        balance += amount
    }

    mutating func withdraw(_ amount: Double) {
        balance -= amount
    }
}

```

c. Add a property called `withdraws` of type `[Double]` that stores all of the withdraws made to the bank account
```
Question 7c Answer

struct BankAccount {
    var owner: String
    var balance: Double
    var deposits: [Double]
    var withdraws: [Double]

    mutating func deposit(_ amount: Double) {
        balance += amount
    }

    mutating func withdraw(_ amount: Double) {
        balance -= amount
    }
}

```

d. Add a property called `startingBalance`.  Have this property be set to the original balance, and don't allow anyone to change it

```
Question 7d Answer

struct BankAccount {
    var owner: String
    var balance: Double
    var deposits: [Double]
    var withdraws: [Double]
    let startingBalance: Double
    
    init(owner: String, balance: Double, deposits: [Double], withdraws: [Double]){
        self.owner = owner
        self.balance = balance
        self.deposits = deposits
        self.withdraws = withdraws
        self.startingBalance = balance
    }

    mutating func deposit(_ amount: Double) {
        balance += amount
    }

    mutating func withdraw(_ amount: Double) {
        balance -= amount
    }
}

```

e. Add a method called `totalGrowth` that returns a double representing the change in the balance from the starting balance to the current balance
```
Question 7e Answer

struct BankAccount {
    var owner: String
    var balance: Double
    var deposits: [Double]
    var withdraws: [Double]
    let startingBalance: Double
    
    init(owner: String, balance: Double, deposits: [Double], withdraws: [Double]){
        self.owner = owner
        self.balance = balance
        self.deposits = deposits
        self.withdraws = withdraws
        self.startingBalance = balance
    }

    mutating func deposit(_ amount: Double) {
        balance += amount
    }

    mutating func withdraw(_ amount: Double) {
        balance -= amount
    }
    
    mutating func totalGrowth() -> Double{
        return self.balance - self.startingBalance
    }
}
```

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
```
Question 8a Answer

func printQuote(_ house: GameOfThronesHouse) -> Void {
    switch house{
    case .stark:
        print("Winter is Coming.")
    case .lannister:
        print("A Lannister always pays his debts.")
    case .targaryen:
        print("Fire and Blood.")
    case .baratheon:
        print("Ours is the fury.")
    }
}
```
b. Move that function to inside the enum as a method
```
Question 8b Answer

enum GameOfThronesHouse: String {
    case stark, lannister, targaryen, baratheon
    
    func printQuote() -> Void{
        switch self{
        case .stark:
            print("Winter is Coming.")
        case .lannister:
            print("A Lannister always pays his debts.")
        case .targaryen:
            print("Fire and Blood.")
        case .baratheon:
            print("Ours is the fury.")
        }
    }
}
```

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
let library2 = library1
library2.add(track: "Come As You Are")
```
```
Question 9 Answer

Libraries 1 and 2 both have the same contents: "Michelle", "Voodoo Child", and "Come As You Are". Library2 was set to library1, which because they are classes, means they both reference the same instance of MusicLibrary. In other words, classes are reference types, and setting one equal to another does not create a new copy, but instead points an additional reference handle at the same instance. 

```

## Question 10

Make a function that takes in an array of strings and returns an array of strings. The function should determine if the string can be typed out using just one row on the keyboard. If the string can be typed out using just one row, that string should be in the returned array.  

```
Input: ["Hello", "Alaska", "Dad", "Peace", "Power"]

Output: ["Alaska", "Dad", "Power"]
```
```
Question 10 Answer

func onOneRow(_ arr: [String]) -> [String]{
    var returnArray: [String] = []
    let rowOne: Set<Character> = ["q","w","e","r","t","y","u","i","o","p"]
    let rowTwo: Set<Character> = ["a","s","d","f","g","h","j","k","l"]
    let rowThree: Set<Character> = ["z","x","c","v","b","n","m"]
    
    for string in arr{
        var tempArr: [Character] = Array(string)
        tempArr = tempArr.map{Character($0.lowercased())}
        let tempSet: Set<Character> = Set(tempArr)
        if tempSet.isSubset(of:rowOne){
            returnArray.append(string)
        } else if tempSet.isSubset(of: rowTwo){
            returnArray.append(string)
        } else if tempSet.isSubset(of: rowThree){
            returnArray.append(string)
        } 
    }
    return returnArray
}
```
