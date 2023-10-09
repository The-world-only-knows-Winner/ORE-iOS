import Foundation

public struct FetchMyInfoResponseDTO: Decodable {
    public let name: String
    public let birth: String

    public init(name: String, birth: String) {
        self.name = name
        self.birth = birth
    }
}
