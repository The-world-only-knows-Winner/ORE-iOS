import Foundation

public struct ChangePasswordRequestDTO: Encodable {
    public let oldPassword: String
    public let newPassword: String

    public init(oldPassword: String, newPassword: String) {
        self.oldPassword = oldPassword
        self.newPassword = newPassword
    }
}
