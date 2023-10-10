import Foundation

public extension FetchMyInfoResponseDTO {
    func toDomain() -> MyInfoEntity {
        MyInfoEntity(name: name, birthday: birthday)
    }
}
