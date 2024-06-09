import SwiftUI

struct Header: View {
    @State private var isLoggedIn = false
    @State private var profileImageOpacity = 0.0
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    HStack {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 40)
                        
                        Spacer()
                        
                        if isLoggedIn {
                            NavigationLink(destination: UserProfile()) {
                                Image("profile-image-placeholder")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                                    .opacity(profileImageOpacity)
                                    .onAppear {
                                        withAnimation(.easeIn(duration: 1.0)) {
                                            profileImageOpacity = 1.0
                                        }
                                    }
                                    .accessibilityLabel("Profile Image")
                                    .accessibilityHint("Navigates to the user profile")
                            }
                            .padding(.trailing)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color(.systemBackground).opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
                .padding(.horizontal)
            }
            .frame(maxHeight: 60)
            .onAppear {
                isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
            }
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
