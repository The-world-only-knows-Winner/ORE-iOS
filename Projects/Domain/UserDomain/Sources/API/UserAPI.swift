import Moya
import UserDomainInterface
import BaseDomain

public enum UserAPI {
    case signup(SignupRequestDTO)
    case fetchMyInfo
    case updateMyInfo(UpdateMyInfoRequestDTO)
}

extension UserAPI: JobisAPI {
    public typealias ErrorType = UserDomainError

    public var domain: JobisDomain {
        .user
    }

    public var urlPath: String {
        switch self {
        case .signup:
            return "/signup"

        case .fetchMyInfo, .updateMyInfo:
            return ""
        }
    }

    public var method: Method {
        switch self {
        case .signup:
            return .post

        case .fetchMyInfo:
            return .get

        case .updateMyInfo:
            return .patch
        }
    }

    public var task: Task {
        switch self {
        case let .signup(req):
            return .requestJSONEncodable(req)

        case .fetchMyInfo:
            return .requestPlain

        case let .updateMyInfo(req):
            return .requestJSONEncodable(req)
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .signup:
            return .none

        case .fetchMyInfo, .updateMyInfo:
            return .accessToken
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .signup:
            return [
                409: .userAlreadyExists
            ]

        case .fetchMyInfo:
            return [:]

        case .updateMyInfo:
            return [:]
        }
    }
}
