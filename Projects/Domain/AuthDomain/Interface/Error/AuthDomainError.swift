import Foundation

public enum AuthDomainError: Error {
    // Signin
    case emailNotFound
    // Signin || ChangePassword
    case passwordMisMatches
    // ChangePassword
    case userNotFound
    // VerifyAuthCode
    case authCodeNotFound
}

extension AuthDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .emailNotFound:
            return "이메일을 찾을 수 없습니다."

        case .passwordMisMatches:
            return "비밀번호가 올바르지 않습니다."

        case .userNotFound:
            return "사용자를 찾을 수 없습니다."

        case .authCodeNotFound:
            return "인증번호가 일치하지 않습니다."
        }
    }
}
