import Moya

public enum RefreshAPI {
    case reissueToken
}

extension RefreshAPI: JobisAPI {
    public typealias ErrorType = Error

    public var domain: JobisDomain {
        .auth
    }

    public var urlPath: String {
        switch self {
        case .reissueToken:
            return "/token"
        }
    }

    public var method: Method {
        switch self {
        case .reissueToken:
            return .put
        }
    }

    public var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .reissueToken:
            return .refreshToken
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        default:
            return [:]
        }
    }
}
