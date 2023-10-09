import Moya
import AuthDomainInterface
import BaseDomain

public enum AuthAPI {
    case signin(SigninRequestDTO)
    case changePassword(ChangePasswordRequestDTO)
    case sendAuthCode(SendAuthCodeRequestDTO)
    case verifyAuthCode(VerifyAuthCodeRequestDTO)
    case logout
    case tokenRefresh
}

extension AuthAPI: JobisAPI {
    public typealias ErrorType = AuthDomainError

    public var domain: JobisDomain {
        .auth
    }

    public var urlPath: String {
        switch self {
        case .signin, .tokenRefresh:
            return "/token"

        case .changePassword:
            return "/password"

        case .verifyAuthCode, .sendAuthCode:
            return "/code"

        case .logout:
            return "/logout"
        }
    }

    public var method: Method {
        switch self {
        case .changePassword, .tokenRefresh:
            return .put

        case .signin, .sendAuthCode:
            return .post

        case .verifyAuthCode:
            return .patch

        case .logout:
            return .delete
        }
    }

    public var task: Task {
        switch self {
        case let .signin(req):
            return .requestJSONEncodable(req)

        case let .changePassword(req):
            return .requestJSONEncodable(req)

        case let .sendAuthCode(req):
            return .requestJSONEncodable(req)

        case let .verifyAuthCode(req):
            return .requestJSONEncodable(req)

        case .logout, .tokenRefresh:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .tokenRefresh:
            return .refreshToken
        default:
            return .none
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .signin:
            return [
                401: .passwordMisMatches,
                404: .emailNotFound
            ]

        case .changePassword:
            return [
                401: .passwordMisMatches,
                404: .userNotFound
            ]

        case .sendAuthCode:
            return [:]

        case .verifyAuthCode:
            return [
                404: .authCodeNotFound
            ]

        case .logout:
            return [:]

        case .tokenRefresh:
            return [
                404: .refreshTokenNotFound
            ]
        }
    }
}
