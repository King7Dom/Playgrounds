//: [Previous](@previous)

//import Foundation

let array: [Any] = [1,[4,3],6,[5,[1,0]]]

struct FlattenArray {
    
    private let array: [Any]
    
    static func unnest(nestedArray: [Any]) -> [Any] {
        return nestedArray.reduce(into: [Any](), { (result, element) in
            if let nestedArray = element as? [Any] {
                result + unnest(nestedArray: nestedArray)
            } else {
                result.append(element)
            }
        })
    }
}

print(array)

//: [Next](@next)
