
import SwiftUI
struct ButtonStyleYellowColorWide: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .white : .black)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : Color.primaryColor2)
            .cornerRadius(8)
            .padding(.horizontal)
            .animation(.easeInOut(duration: 0.2)) // Add animation
            .font(Font.body.bold()) // Ensure consistent font style
            .minHeight(44) // Ensure minimum button size
    }
}

struct ButtonStylePrimaryColor1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.primaryColor1 : .white)
            .padding(10)
            .background(configuration.isPressed ? .white : Color.primaryColor1)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            .padding(.horizontal)
            .animation(.easeInOut(duration: 0.2)) // Add animation
            .font(Font.body.bold()) // Ensure consistent font style
            .minHeight(44) // Ensure minimum button size
    }
}

struct ButtonStylePrimaryColorReverse: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .white : Color.primaryColor1)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            .padding(.horizontal)
            .animation(.easeInOut(duration: 0.2)) // Add animation
            .font(Font.body.bold()) // Ensure consistent font style
            .minHeight(44) // Ensure minimum button size
    }
}

struct MyToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
            }
            .padding(10)
            .background(configuration.isOn ? Color.primaryColor1 : Color.clear)
            .cornerRadius(8)
            .animation(.easeInOut(duration: 0.2)) // Add animation
            .foregroundColor(Color.primaryColor1)
            .font(Font.body.bold()) // Ensure consistent font style
        }
    }
}
