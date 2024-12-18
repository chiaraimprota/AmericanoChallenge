import SwiftUI

struct ActivitiesView: View {
    @Binding var expenses: [ExpenseModel]
    @State private var showAddExpenseSheet = false

    var body: some View {
        NavigationView {
            List(expenses) { expense in
                HStack {
                    iconForCategory(expense.category)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                    
                    VStack(alignment: .leading) {
                        Text(expense.category)
                            .font(.headline)
                        
                        Text(expense.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text("You get back \(currencySymbol(for: expense.currency))\(expense.amount / 2, specifier: "%.2f")")
                            .font(.footnote)
                            .foregroundColor(.green)
                    }
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Activities")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddExpenseSheet = true }) {
                        Label("Add Expenses", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddExpenseSheet) {
                AddExpenseView(expenses: $expenses, childViewModel: ChildViewModel())
            }
        }
    }

    private func iconForCategory(_ category: String) -> Image {
        switch category {
        case "Sport":
            return Image(systemName: "sportscourt.fill")
        case "School":
            return Image(systemName: "book.fill")
        case "Health":
            return Image(systemName: "cross.case.fill")
        case "Entertainment":
            return Image(systemName: "play.tv.fill")
        case "Clothing":
            return Image(systemName: "tshirt.fill")
        case "Groceries":
            return Image(systemName: "cart.fill")
        case "Transportation":
            return Image(systemName: "car.fill")
        case "Hobbies":
            return Image(systemName: "paintbrush.pointed.fill")
        case "Technology":
            return Image(systemName: "laptopcomputer")
        case "Utilities":
            return Image(systemName: "bolt.fill")
        case "Celebrations":
            return Image(systemName: "gift.fill")
        case "Childcare":
            return Image(systemName: "figure.2.and.child.holdinghands")
        case "Vacation":
            return Image(systemName: "airplane")
        case "Books & Stationery":
            return Image(systemName: "pencil.and.ruler.fill")
        case "Other":
            return Image(systemName: "questionmark.circle.fill")
        default:
            return Image(systemName: "questionmark.circle.fill")
        }
    }

    private func currencySymbol(for currencyCode: String) -> String {
        switch currencyCode {
        case "EUR": return "€"
        case "USD": return "$"
        case "GBP": return "£"
        case "JPY": return "¥"
        case "AUD": return "A$"
        case "CAD": return "C$"
        case "CHF": return "CHF"
        case "CNY": return "¥"
        case "INR": return "₹"
        default: return currencyCode
        }
    }
}
