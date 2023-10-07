import Foundation

public struct VerifyAuthCodeRequestDTO: Encodable {
    public let email: String
    public let authCode: String

    public init(email: String, authCode: String) {
        self.email = email
        self.authCode = authCode
    }
}
