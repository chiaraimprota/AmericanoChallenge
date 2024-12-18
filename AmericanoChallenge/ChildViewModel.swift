import Foundation

class ChildViewModel: ObservableObject {
    @Published var children: [Child] = [
        Child(name: "Mario"),
        Child(name: "Luca"),
        Child(name: "Anna")
    ]
}
