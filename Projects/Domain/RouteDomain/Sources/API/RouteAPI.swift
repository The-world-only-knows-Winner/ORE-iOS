import Moya
import RouteDomainInterface
import BaseDomain
import CoreLocation

public enum RouteAPI {
    case fetchRouteList(startPoint: CLLocationCoordinate2D, endpoint: CLLocationCoordinate2D)
    case addRoute(AddRouteRequestDTO)
    case fetchMyRouteList
}

extension RouteAPI: JobisAPI {
    public typealias ErrorType = Error

    public var domain: JobisDomain {
        .route
    }

    public var urlPath: String {
        switch self {
        case .fetchRouteList, .addRoute:
            return ""

        case .fetchMyRouteList:
            return "/my"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchRouteList, .fetchMyRouteList:
            return .get

        case .addRoute:
            return .post
        }
    }

    public var task: Task {
        switch self {
        case let .fetchRouteList(startPoint, endpoint):
            return .requestParameters(parameters: [
                "start_x_point": startPoint.latitude,
                "start_y_point": startPoint.latitude,
                "end_x_point": endpoint.latitude,
                "end_y_point": endpoint.latitude
            ], encoding: URLEncoding.queryString)

        case let .addRoute(req):
            return .requestJSONEncodable(req)

        case .fetchMyRouteList:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchRouteList, .addRoute, .fetchMyRouteList:
            return .accessToken
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .fetchRouteList:
            return [:]

        case .addRoute:
            return [:]

        case .fetchMyRouteList:
            return [:]
        }
    }
}
