import Foundation

enum Transaction {
    case payment
    case request
    case split
}

struct Payment {
    let amount: Int
    let fromUser: User
    let toUser: User
}

struct Request {
    let amount: Int
    let fromUser: User
    let toUser: User
    let referenceID: UUID
}

struct User: Codable {
    let name: String
    let identifier: String
}
