import Foundation

public enum RefreshDomainError: Error {
    case refreshTokenNotFound
}

extension RefreshDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .refreshTokenNotFound:
            return "사용자를 찾을 수 없습니다."
        }
    }
}
