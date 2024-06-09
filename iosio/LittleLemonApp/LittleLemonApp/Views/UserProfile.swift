import SwiftUI

struct UserProfile: View {
    @StateObject private var viewModel = ViewModel()
    
    @Environment(\.presentationMode) var presentation
    
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    
    @State private var isLoggedOut = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Header()
                    Hero()
                        .padding()
                        .background(Color.primaryColor1)
                        .frame(maxWidth: .infinity, maxHeight: 240)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("First Name *")
                            .onboardingTextStyle()
                        TextField("First Name", text: $firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("Last Name *")
                            .onboardingTextStyle()
                        TextField("Last Name", text: $lastName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Text("E-mail *")
                            .onboardingTextStyle()
                        TextField("E-mail", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                        
                        Text("Phone Number")
                            .onboardingTextStyle()
                        TextField("Phone Number", text: $phoneNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.phonePad)
                    }
                    .padding()
                    
                    Text("Email Notifications")
                        .font(.sectionTitle())
                        .foregroundColor(.primaryColor1)
                    VStack {
                        Toggle("Order Statuses", isOn: $orderStatuses)
                        Toggle("Password Changes", isOn: $passwordChanges)
                        Toggle("Special Offers", isOn: $specialOffers)
                        Toggle("Newsletter", isOn: $newsletter)
                    }
                    .padding()
                    .font(Font.leadText())
                    .foregroundColor(.primaryColor1)
                    
                    Button("Log Out") {
                        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                        presentation.wrappedValue.dismiss()
                    }
                    .buttonStyle(ButtonStyleYellowColorWide())
                    .padding()
                    
                    HStack {
                        Button("Discard Changes") {
                            resetFields()
                        }
                        .buttonStyle(ButtonStylePrimaryColorReverse())
                        
                        Button("Save Changes") {
                            saveChanges()
                        }
                        .buttonStyle(ButtonStylePrimaryColor1())
                    }
                    .padding()
                    
                    if viewModel.errorMessageShow {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.horizontal)
                    }
                }
                .padding(.bottom, isLoggedOut ? 100 : 0)
            }
            .onAppear {
                loadData()
            }
            .navigationBarTitle("User Profile", displayMode: .inline)
            .padding(.horizontal)
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
    
    private func loadData() {
        firstName = viewModel.firstName
        lastName = viewModel.lastName
        email = viewModel.email
        phoneNumber = viewModel.phoneNumber
        
        orderStatuses = viewModel.orderStatuses
        passwordChanges = viewModel.passwordChanges
        specialOffers = viewModel.specialOffers
        newsletter = viewModel.newsletter
    }
    
    private func saveChanges() {
        if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
            UserDefaults.standard.set(firstName, forKey: kFirstName)
            UserDefaults.standard.set(lastName, forKey: kLastName)
            UserDefaults.standard.set(email, forKey: kEmail)
            UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
            UserDefaults.standard.set(orderStatuses, forKey: kOrderStatuses)
            UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
            UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
            UserDefaults.standard.set(newsletter, forKey: kNewsletter)
            
            presentation.wrappedValue.dismiss()
        }
    }
    
    private func resetFields() {
        firstName = viewModel.firstName
        lastName = viewModel.lastName
        email = viewModel.email
        phoneNumber = viewModel.phoneNumber
        
        orderStatuses = viewModel.orderStatuses
        passwordChanges = viewModel.passwordChanges
        specialOffers = viewModel.specialOffers
        newsletter = viewModel.newsletter
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
