import SwiftUI

struct AddChildView: View {
    @ObservedObject var viewModel: ChildViewModel
    @State private var childName: String = ""

    var body: some View {
        Form {
            Section(header: Text("Add a new child")) {
                TextField("Enter child name", text: $childName)
            }

            Button(action: addChild) {
                Text("Add Child")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationTitle("Add Child")
    }

    private func addChild() {
        guard !childName.isEmpty else { return }
        viewModel.children.append(Child(name: childName))
        childName = ""
    }
}
