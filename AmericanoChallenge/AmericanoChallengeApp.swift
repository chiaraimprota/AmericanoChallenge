import SwiftUI

@main
struct ThemisApp: App {
    @StateObject private var childViewModel = ChildViewModel()
    @State private var expenses: [ExpenseModel] = [] // Array condiviso per le spese

    var body: some Scene {
        WindowGroup {
            TabView {
                // Tab Children
                ChildrenView(viewModel: childViewModel)
                    .tabItem {
                        Image(systemName: "person.2.fill")
                        Text("Children")
                    }


                // Tab Activities
                ActivitiesView(expenses: $expenses)
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Activities")
                    }
            }
        }
    }
}
