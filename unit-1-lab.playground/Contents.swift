import UIKit


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

let declarationOfIndependenceArray = declarationOfIndependence.lowercased().components(separatedBy: " ")
let punctuationAndLines = CharacterSet.punctuationCharacters.union(CharacterSet.whitespacesAndNewlines)
var dirtyDeclaration = [String]()

for string in declarationOfIndependenceArray {
    dirtyDeclaration.append (string.filter() { !punctuationAndLines.contains(UnicodeScalar(String($0))!)
    } )
}

dirtyDeclaration = dirtyDeclaration.filter( { $0.count > 5})
var declarationDict = [String: Int]()
for string in dirtyDeclaration {
    declarationDict[string] = (declarationDict[string] ?? 0) + 1
}
var highestCount = 0
var mostFreqWord = ""
for (key, value) in declarationDict {
    if value > highestCount {
        highestCount = value
        mostFreqWord = key
    }
}
print(mostFreqWord)

func mostFreqWord(_ string: String) -> String {
    let punctLines = CharacterSet.punctuationCharacters.union(CharacterSet.whitespacesAndNewlines)
    let stringArr = (string.lowercased().components(separatedBy: punctLines)).filter( { $0.count > 5 })
    var stringDict = [String: Int]()
    var stringHighestCount = 0
    var stringHighestCountWord = ""
    for string in stringArr {
        stringDict[string] = (stringDict[string] ?? 0) + 1
    }
    for (key,value) in stringDict {
        if stringHighestCount < value {
            stringHighestCount = value
            stringHighestCountWord = key
        }
    }
    return stringHighestCountWord
}

print(mostFreqWord(declarationOfIndependence))

var someRepeatsAgain = [25,11,30,31,50,28,4,37,13,20,24,38,28,14,44,33,7,43,39,35,36,42,1,40,7,14,23,46,21,39,11,42,12,38,41,48,20,23,29,24,50,41,38,23,11,30,50,13,13,16,10,8,3,43,10,20,28,39,24,36,21,13,40,25,37,39,31,4,46,20,38,2,7,11,11,41,45,9,49,31,38,23,41,16,49,29,14,6,6,11,5,39,13,17,43,1,1,15,25]

func elementsTwice(_ arr: [Int]) -> [Int] {
    let arr = arr.sorted()
    var prevIndex = 0
    var twiceArr = [Int]()
    for index in 1..<arr.count {
        if arr[prevIndex] == arr[index] {
            twiceArr.append(arr[index])
        }
        prevIndex = index
    }
    return Array(Set(twiceArr)).sorted()
}

func sumTo10(_ arr: [Int]) {
    var sumArr10 = [Set<Int>]()
    for num1 in arr {
        for num2 in arr where num2 != num1{
            for num3 in arr where num3 != num2 && num3 != num1 {
                if num1 + num2 + num3 == 10 {
                    sumArr10.append([num1, num2, num3])
                }
            }
        }
    }
    for set in Array(Set(sumArr10)) {
        print(set)
    }
}

var tripleSumArr = [-20,-14, -8,-5,-3,-2,1,2,3,4,9,15,20,30]
sumTo10(tripleSumArr)

let hi = "hello there"
print(hi.sorted(by: {$0 > $1 }))

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

var codeString = "aldfjaekwjnfaekjnf"
var codeletter = ""
let codeStrung = codeString.sorted(by: {letterValues[String($0)]! < letterValues[String($1)]!})
for char in codeStrung {
    codeletter += String(char)
}
print(codeletter)

func arrayWithLargestSum(_ arrArr: [[Int]]) -> [Int] {
    var arrayDict = [[Int] : Int]()
    var largestSumArr = [Int]()
    var largestSum = 0
    for arr in arrArr {
        for num in arr {
            arrayDict[arr] = (arrayDict[arr] ?? 0) + num
        }
    }
    for (key,value) in arrayDict {
        if largestSum < value {
            largestSum = value
            largestSumArr = key
        }
    }
    return largestSumArr
}

arrayWithLargestSum([[2,4,1],[3,0],[9,3]])

struct Receipt {
    let storeName: String
    let items: [ReceiptItem]
    
    func totalPrice() -> Double {
        var sum = 0.0
        for item in self.items {
            sum += item.price
        }
        return sum
    }
}

struct ReceiptItem {
    let name: String
    let price: Double
}

func storeReceipts(_ arr: [Receipt], store: String) -> [Receipt] {
    var matchingStoreReceipts = [Receipt]()
    for receipt in arr {
        if receipt.storeName == store {
            matchingStoreReceipts.append(receipt)
        }
    }
    return matchingStoreReceipts
}

func sortedByPrice(_ arr: [Receipt]) -> [Receipt] {
    arr.sorted(by: {$0.totalPrice() < $1.totalPrice()} )
}

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

let edgar = Giant(name: "Edgar", weight: 520.0, homePlanet: "Earth")
let jason = edgar
jason.name = "Jason"
print(edgar.name)
print(jason.name)

struct BankAccount {
    var owner: String
    var balance: Double
    var deposits = [Double]()
    var withdraws = [Double]()
    private var startingBalance: Double { didSet { startingBalance = balance } }
    
    mutating func deposit(_ amount: Double) {
        balance += amount
        deposits.append(amount)
    }
    
    mutating func withdraw(_ amount: Double) {
        balance -= amount
        withdraws.append(amount)
    }
    
    func totalGrowth() -> Double {
        ((balance - startingBalance) / startingBalance) * 100
    }
    
    init(owner: String, balance: Double) {
        self.owner = owner
        self.balance = balance
        self.startingBalance = balance
    }
}

var bank = BankAccount(owner: "Howard", balance: 20)
bank.deposit(25)
print(bank.balance)

enum GameOfThronesHouse: String {
    case stark, lannister, targaryen, baratheon
    
    func houseMotto() -> String {
        switch self {
        case .stark:
            return "Ours is the Fury"
        case .lannister:
            return "Winter is coming"
        case .targaryen:
            return "Fire and Blood"
        case .baratheon:
            return "A Lannister always pays his debts."
        }
    }
}

func houseMotto(_ house: GameOfThronesHouse) -> String {
    switch house {
    case .stark:
        return "Ours is the Fury"
    case .lannister:
        return "Winter is coming"
    case .targaryen:
        return "Fire and Blood"
    case .baratheon:
        return "A Lannister always pays his debts."
    }
}

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

print(library1.tracks)
print(library2.tracks)

let row1 = Set("`1234567890-=~!@#$%^&*()_+")
let row2 = Set("qwertyuiop[]QWERTYUIOP{}|")
let row3 = Set("asdfghjkl;'ASDFGHJKL:")
let row4 = Set("zxcvbnm,./ZXCVBNM<>?")

let ok = "opz"
row2.isSuperset(of: ok)
func oneRowStrings(_ arr: [String]) -> [String] {
    let row1 = Set("`1234567890-=~!@#$%^&*()_+")
    let row2 = Set("qwertyuiop[]QWERTYUIOP{}|")
    let row3 = Set("asdfghjkl;'ASDFGHJKL:")
    let row4 = Set("zxcvbnm,./ZXCVBNM<>?")
    var oneRowString = [String]()
    
    for string in arr {
        if row1.isSuperset(of: string) ||
            row2.isSuperset(of: string) ||
            row3.isSuperset(of: string) ||
            row4.isSuperset(of: string) {
            oneRowString.append(string)
        }
    }
    return oneRowString
}

oneRowStrings(["Hello", "Alaska", "Dad", "Peace", "Power"])
