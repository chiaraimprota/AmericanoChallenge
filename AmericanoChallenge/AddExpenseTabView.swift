import SwiftUI

struct AddExpenseTabView: View {
    @State private var selectedChild: String = ""
    @State private var selectedCategory: String = ""
    @State private var selectedCurrency: String = ""
    @State private var amount: String = ""
    @State private var description: String = ""
    @State private var showActivitiesView = false

    @Binding var expenses: [ExpenseModel] // Elenco condiviso delle spese

    let children = ["Mario", "Luca", "Anna"] // Figli di esempio
    let categories = [
        "Sport",
        "School",
        "Health",
        "Entertainment",
        "Clothing",
        "Groceries",
        "Transportation",
        "Hobbies",
        "Technology",
        "Utilities",
        "Celebrations",
        "Childcare",
        "Vacation",
        "Books & Stationery",
        "Other"
    ]
    let currencies = ["EUR", "USD", "GBP", "JPY", "AUD"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Expense Details")) {
                    // Selettore per il figlio
                    HStack {
                        Text("Child")
                            .frame(width: 100, alignment: .leading)
                        Spacer()
                        Menu {
                            ForEach(children, id: \..self) { child in
                                Button(action: {
                                    selectedChild = child
                                }) {
                                    Text(child)
                                }
                            }
                        } label: {
                            HStack {
                                Text(selectedChild.isEmpty ? "Select Child" : selectedChild)
                                    .foregroundColor(selectedChild.isEmpty ? .gray : .primary)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray)
                            }
                        }
                    }

                    // Selettore per la categoria
                    HStack {
                        Text("Category")
                            .frame(width: 100, alignment: .leading)
                        Spacer()
                        Menu {
                            ForEach(categories, id: \..self) { category in
                                Button(action: {
                                    selectedCategory = category
                                }) {
                                    Text(category)
                                }
                            }
                        } label: {
                            HStack {
                                Text(selectedCategory.isEmpty ? "Select Category" : selectedCategory)
                                    .foregroundColor(selectedCategory.isEmpty ? .gray : .primary)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray)
                            }
                        }
                    }

                    // Selettore per la valuta
                    HStack {
                        Text("Currency")
                            .frame(width: 100, alignment: .leading)
                        Spacer()
                        Menu {
                            ForEach(currencies, id: \..self) { currency in
                                Button(action: {
                                    selectedCurrency = currency
                                }) {
                                    Text(currency)
                                }
                            }
                        } label: {
                            HStack {
                                Text(selectedCurrency.isEmpty ? "Select Currency" : selectedCurrency)
                                    .foregroundColor(selectedCurrency.isEmpty ? .gray : .primary)
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.gray)
                            }
                        }
                    }

                    // Campo per l'importo
                    HStack {
                        TextField("Amount", text: $amount)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 5)
                    }
                    .padding(.vertical, 8)

                    // Campo per la descrizione
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
                .padding()
            }
            .navigationTitle("Add Expense")
            .sheet(isPresented: $showActivitiesView) {
                ActivitiesView(expenses: $expenses)
            }
        }
    }

    private func addExpense() {
        guard !selectedChild.isEmpty,
              !selectedCategory.isEmpty,
              !selectedCurrency.isEmpty,
              let amountValue = Double(amount),
              !description.isEmpty else {
            print("Invalid input")
            return
        }

        // Aggiungi la nuova spesa
        let newExpense = ExpenseModel(
            name: selectedChild,
            category: selectedCategory,
            amount: amountValue,
            currency: selectedCurrency,
            description: description
        )
        expenses.append(newExpense)

        // Svuota i campi di input
        selectedChild = ""
        selectedCategory = ""
        selectedCurrency = ""
        amount = ""
        description = ""

        // Mostra la vista delle attività
        showActivitiesView = true
    }
}
