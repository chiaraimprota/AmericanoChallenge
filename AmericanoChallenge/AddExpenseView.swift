import SwiftUI

struct AddExpenseView: View {
    @Binding var expenses: [ExpenseModel]
    @ObservedObject var childViewModel: ChildViewModel

    @State private var selectedChild: String = ""
    @State private var category: String = ""
    @State private var amount: String = ""
    @State private var selectedCurrency: String = "EUR"
    @State private var description: String = ""

    let categories = [
        "Sport", "School", "Health", "Entertainment", "Clothing",
        "Groceries", "Transportation", "Hobbies", "Technology",
        "Utilities", "Celebrations", "Childcare", "Vacation",
        "Books & Stationery", "Other"
    ]

    let currencies = ["USD", "EUR", "GBP", "JPY", "AUD", "CAD", "CHF"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Expense Details")) {
                    Picker("Select Child", selection: $selectedChild) {
                        ForEach(childViewModel.children.map { $0.name }, id: \.self) { child in
                            Text(child).tag(child)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())

                    Picker("Select Category", selection: $category) {
                        ForEach(categories, id: \.self) { cat in
                            Text(cat).tag(cat)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())

                    HStack {
                        Picker("Currency", selection: $selectedCurrency) {
                            ForEach(currencies, id: \.self) { currency in
                                Text(currency).tag(currency)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                        TextField("Amount", text: $amount)
                            .keyboardType(.decimalPad)
                    }

                    TextField("Description", text: $description)
                }

                Button(action: addExpense) {
                    Text("Add Expense")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Add Expense")
        }
    }

    private func addExpense() {
        guard !selectedChild.isEmpty,
              !category.isEmpty,
              let amountValue = Double(amount),
              !description.isEmpty else {
            return
        }

        let newExpense = ExpenseModel(
            name: selectedChild,
            category: category,
            amount: amountValue,
            currency: selectedCurrency,
            description: description
        )
        expenses.append(newExpense)
        resetFields()
    }

    private func resetFields() {
        selectedChild = ""
        category = ""
        amount = ""
        selectedCurrency = "EUR"
        description = ""
    }
}
