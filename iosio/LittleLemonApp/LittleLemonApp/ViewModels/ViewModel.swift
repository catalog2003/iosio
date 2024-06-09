import Foundation
import Combine

struct UserDefaultsKeys {
    static let firstName = "firstNameKey"
    static let lastName = "lastNameKey"
    static let email = "emailKey"
    static let isLoggedIn = "isLoggedInKey"
    static let phoneNumber = "phoneNumberKey"
    static let orderStatuses = "orderStatusesKey"
    static let passwordChanges = "passwordChangesKey"
    static let specialOffers = "specialOffersKey"
    static let newsletter = "newsletterKey"
}

class ViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    @Published var firstName: String {
        didSet { UserDefaults.standard.set(firstName, forKey: UserDefaultsKeys.firstName) }
    }
    @Published var lastName: String {
        didSet { UserDefaults.standard.set(lastName, forKey: UserDefaultsKeys.lastName) }
    }
    @Published var email: String {
        didSet { UserDefaults.standard.set(email, forKey: UserDefaultsKeys.email) }
    }
    @Published var phoneNumber: String {
        didSet { UserDefaults.standard.set(phoneNumber, forKey: UserDefaultsKeys.phoneNumber) }
    }
    
    @Published var orderStatuses: Bool {
        didSet { UserDefaults.standard.set(orderStatuses, forKey: UserDefaultsKeys.orderStatuses) }
    }
    @Published var passwordChanges: Bool {
        didSet { UserDefaults.standard.set(passwordChanges, forKey: UserDefaultsKeys.passwordChanges) }
    }
    @Published var specialOffers: Bool {
        didSet { UserDefaults.standard.set(specialOffers, forKey: UserDefaultsKeys.specialOffers) }
    }
    @Published var newsletter: Bool {
        didSet { UserDefaults.standard.set(newsletter, forKey: UserDefaultsKeys.newsletter) }
    }
    
    @Published var errorMessageShow = false
    @Published var errorMessage = ""
    
    @Published var searchText = ""

    init() {
        firstName = UserDefaults.standard.string(forKey: UserDefaultsKeys.firstName) ?? ""
        lastName = UserDefaults.standard.string(forKey: UserDefaultsKeys.lastName) ?? ""
        email = UserDefaults.standard.string(forKey: UserDefaultsKeys.email) ?? ""
        phoneNumber = UserDefaults.standard.string(forKey: UserDefaultsKeys.phoneNumber) ?? ""
        
        orderStatuses = UserDefaults.standard.bool(forKey: UserDefaultsKeys.orderStatuses)
        passwordChanges = UserDefaults.standard.bool(forKey: UserDefaultsKeys.passwordChanges)
        specialOffers = UserDefaults.standard.bool(forKey: UserDefaultsKeys.specialOffers)
        newsletter = UserDefaults.standard.bool(forKey: UserDefaultsKeys.newsletter)
    }
    
    func validateUserInput(firstName: String, lastName: String, email: String, phoneNumber: String) -> Bool {
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
            setErrorMessage("All fields are required")
            return false
        }
        
        guard email.contains("@"), email.split(separator: "@").count == 2, email.split(separator: "@")[1].contains(".") else {
            setErrorMessage("Invalid email address")
            return false
        }
        
        guard phoneNumber.isEmpty || (phoneNumber.first == "+" && phoneNumber.dropFirst().allSatisfy { $0.isNumber }) else {
            setErrorMessage("Invalid phone number format.")
            return false
        }
        
        clearErrorMessage()
        return true
    }
    
    private func setErrorMessage(_ message: String) {
        errorMessage = NSLocalizedString(message, comment: "")
        errorMessageShow = true
    }
    
    private func clearErrorMessage() {
        errorMessage = ""
        errorMessageShow = false
    }
}
