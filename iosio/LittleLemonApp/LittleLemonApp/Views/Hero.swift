import SwiftUI

struct Hero: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Little Lemon")
                        .foregroundColor(Color.primaryColor2)
                        .font(.largeTitle.weight(.bold))
                    
                    Text("Chicago")
                        .foregroundColor(.white)
                        .font(.title2.weight(.semibold))
                    
                    Text("""
                    We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                    """)
                    .foregroundColor(.white)
                    .font(.body)
                    .lineLimit(nil)
                }
                
                Spacer()
                
                Image("hero-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 5)
                    .accessibilityLabel("Hero Image")
                    .accessibilityHint("Image of the Little Lemon restaurant")
            }
            .padding()
            .background(Color.primaryColor1)
            .cornerRadius(16)
            .shadow(radius: 10)
            .padding()
            .accessibilityElement(children: .combine)
        }
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.primaryColor1)
            .frame(maxWidth: .infinity, maxHeight: 240)
    }
}
