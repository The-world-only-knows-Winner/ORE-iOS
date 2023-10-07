import Foundation

public struct SendAuthCodeRequestDTO: Encodable {
    public let email: String

    public init(email: String) {
        self.email = email
    }
}
