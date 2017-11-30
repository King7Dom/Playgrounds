
import Foundation

let fileURL = Bundle.main.url(forResource: "JSON", withExtension: "json")!
let jsonData = try Data(contentsOf: fileURL)

let transactions = try JSONDecoder().decode([Transaction].self, from: jsonData)

if case .payment(let payment) = transactions[0] {
    payment.amount
    payment.fromUser
    payment.toUser
}

if case .request(let request) = transactions[1] {
    request
}

if case .split(let split) = transactions[2] {
    split.amount
    split.users
    split.referenceID
}
