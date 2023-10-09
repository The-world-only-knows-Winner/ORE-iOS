import Foundation

public enum UserDomainError: Error {
    // Sign in
    case userAlreadyExists
}

extension UserDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .userAlreadyExists:
            return "이미 존재하는 계정이 있습니다."
        }
    }
}
