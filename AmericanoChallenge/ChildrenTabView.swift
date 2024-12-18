import SwiftUI

struct ChildrenTabView: View {
    let children = ["Mario", "Luca", "Anna"] // Nomi di esempio

    var body: some View {
        NavigationView {
            List(children, id: \.self) { child in
                HStack {
                    Circle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 40, height: 40)
                    Text(child)
                        .font(.headline)
                        .padding(.leading, 8)
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Children")
        }
    }
}

struct ChildrenTabView_Previews: PreviewProvider {
    static var previews: some View {
        ChildrenTabView()
    }
}
