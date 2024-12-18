import SwiftUI

struct MainTabView: View {
    @State private var expenses: [ExpenseModel] = [] // Elenco delle spese condiviso
    @StateObject private var childViewModel = ChildViewModel() // ViewModel condiviso

    var body: some View {
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
