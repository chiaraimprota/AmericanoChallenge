import SwiftUI

struct ChildrenView: View {
    @ObservedObject var viewModel: ChildViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.children) { child in
                    HStack {
                        Circle()
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [randomColor(), randomColor()]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(width: 50, height: 50)
                        Text(child.name)
                            .font(.headline)
                    }
                }
                .onDelete(perform: deleteChild)
            }
            .navigationTitle("Children")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddChildView(viewModel: viewModel)) {
                        Text("Add Children")
                    }
                }
            }
        }
    }

    private func deleteChild(at offsets: IndexSet) {
        viewModel.children.remove(atOffsets: offsets)
    }

    private func randomColor() -> Color {
        Color(hue: Double.random(in: 0...1), saturation: 0.8, brightness: 0.8)
    }
}
