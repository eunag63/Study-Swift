import Swift

// Array
var someArray: Array<Int> = Array<Int>()
someArray.append(1)
someArray.contains(100)
someArray.remove(at: 0)
//someArray.removeLast()
someArray.removeAll()
someArray.count

// Dictionary
var someDictionary: Dictionary<String, Any> = [String: Any]()
someDictionary["someKey"] = "value"
someDictionary["anotherKey"] = 100
someDictionary.removeValue(forKey: "anotherKey")

// Set
var someSet: Set<Int> = Set<Int>()
someSet.insert(1)
someSet.contains(1)
someSet.remove(100)
someSet.count

let setA: Set<Int> = [1,2,3,4,5]
let setB: Set<Int> = [3,4,5,6,7]

let union: Set<Int> = setA.union(setB)
let sortedUnion: [Int] = union.sorted()
let intersection: Set<Int> = setA.intersection(setB)
let subtracting: Set<Int> = setA.subtracting(setB)
