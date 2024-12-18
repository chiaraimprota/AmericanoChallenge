import SwiftUI

struct ChildListView: View {
    @ObservedObject var viewModel: ChildViewModel

    var body: some View {
        NavigationView {
            List(viewModel.children) { child in
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
            .navigationTitle("Children List")
        }
    }
    
    private func randomColor() -> Color {
        Color(hue: Double.random(in: 0...1), saturation: 0.8, brightness: 0.8)
    }
}
