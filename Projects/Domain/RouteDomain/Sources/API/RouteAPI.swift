import Moya
import RouteDomainInterface
import BaseDomain
import CoreLocation

public enum RouteAPI {
    case fetchRoute(startPoint: CLLocationCoordinate2D, endpoint: CLLocationCoordinate2D)
    case addRoute(AddRouteRequestDTO)
}

extension RouteAPI: JobisAPI {
    public typealias ErrorType = RouteDomainError

    public var domain: JobisDomain {
        .route
    }

    public var urlPath: String {
        switch self {
        case .fetchRoute, .addRoute:
            return ""
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchRoute:
            return .get

        case .addRoute:
            return .post
        }
    }

    public var task: Task {
        switch self {
        case let .fetchRoute(startPoint, endpoint):
            return .requestParameters(parameters: [
                "start_x_point": startPoint.latitude,
                "start_y_point": startPoint.latitude,
                "end_x_point": endpoint.latitude,
                "end_y_point": endpoint.latitude
            ], encoding: URLEncoding.queryString)

        case let .addRoute(req):
            return .requestJSONEncodable(req)

        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchRoute, .addRoute, .fetchMyRoute:
            return .accessToken
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .fetchRoute:
            return [:]

        case .addRoute:
            return [:]

        }
    }
}
