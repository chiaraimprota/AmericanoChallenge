import Foundation

struct ExpenseModel: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let amount: Double
    let currency: String
    let description: String
}
