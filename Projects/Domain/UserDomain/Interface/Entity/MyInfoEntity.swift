import Foundation

public struct MyInfoEntity: Equatable {
    public let name: String
    public let birthday: String

    public init(name: String, birthday: String) {
        self.name = name
        self.birthday = birthday
    }
}
