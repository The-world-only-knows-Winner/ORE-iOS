import Foundation

public struct SignupRequestDTO: Encodable {
    public let email: String
    public let password: String
    public let name: String
    public let birthday: String

    public init(email: String, password: String, name: String, birthday: String) {
        self.email = email
        self.password = password
        self.name = name
        self.birthday = birthday
    }
}
