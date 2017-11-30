import Foundation

public enum Transaction: Decodable {
    case payment(Payment)
    case request(Request)
    case split(Split)

    private enum CodingKeys: String, CodingKey {
        case type
    }

    private enum TransactionType: String, Decodable {
        case payment = "payment"
        case request = "request"
        case split = "split"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(TransactionType.self, forKey: CodingKeys.type)

        switch type {
        case .payment: self = .payment(try Payment(from: decoder))
        case .request: self = try .request(Request(from: decoder))
        case .split: self = try .split(Split(from: decoder))
        }
    }
}

public struct Payment: Codable {
    public let amount: Int
    public let fromUser: User
    public let toUser: User
}

public struct Request: Codable {
    public let amount: Int
    public let fromUser: User
    public let toUser: User
    public let referenceID: UUID
}

public struct Split: Codable {
    public let amount: Int
    public let users: [User]
    public let referenceID: UUID
}

public struct User: Codable {
    public let name: String
    public let identifier: String
}
