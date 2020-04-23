import SwiftUI

struct BlockButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                Rectangle().fill(Color.accentColor)
                    .overlay(configuration.isPressed ? Color.secondary : Color.clear)
            )
            .clipShape(RoundedRectangle(cornerRadius: 8))

    }
}

struct RaisedButtonStyle: ButtonStyle {

    let depth: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        let currentDepth = configuration.isPressed ? 0 : depth
        return configuration.label
            .offset(x: 0, y: -currentDepth/1.5)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                Rectangle().fill(Color.secondary)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(
                    RoundedRectangle(cornerRadius: 8).fill(Color.accentColor)
                    .offset(x: 0, y: -currentDepth)
                )
            )
    }
}

struct CapsuleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.system(.body).bold())
            .foregroundColor(
                configuration.isPressed ? .white : .accentColor)
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                Capsule().stroke(Color.accentColor, lineWidth: 3)
                    .overlay(
                        configuration.isPressed ? pressedOverlay() : normalOverlay()
                    )
            )
    }

    private func pressedOverlay() -> AnyView {
        AnyView(
            Capsule().fill(Color.accentColor)
        )
    }

    private func normalOverlay() -> AnyView {
        AnyView(
            Capsule().stroke(Color.accentColor, lineWidth: 1)
                        .padding(4)
        )
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {}) {
                Text("Get Started")
            }.buttonStyle(BlockButtonStyle())

            Button(action: {}) {
                Text("Get Started")
            }.buttonStyle(RaisedButtonStyle(depth: 4))

            Button(action: {}) {
                Text("Get Started")
            }.buttonStyle(CapsuleButtonStyle())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark")

            ContentView()
            .preferredColorScheme(.light)
            .previewDisplayName("Light")
        }
    }
}
