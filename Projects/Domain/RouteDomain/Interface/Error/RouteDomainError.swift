import Foundation

public enum RouteDomainError: Error {
    // Sign in
    case userAlreadyExists
}

extension RouteDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .userAlreadyExists:
            return "이미 존재하는 계정이 있습니다."
        }
    }
}
