import Moya
import StationDomainInterface
import BaseDomain

public enum StationAPI {
    case fetchRouteStationList(stationName: String)
    case fetchStationByStationName(routeID: String)
}

extension StationAPI: JobisAPI {
    public typealias ErrorType = Error

    public var domain: JobisDomain {
        .station
    }

    public var urlPath: String {
        switch self {
        case .fetchRouteStationList:
            return ""

        case let .fetchStationByStationName(routeID):
            return "/\(routeID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchRouteStationList, .fetchStationByStationName:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case let .fetchRouteStationList(stationName):
            return .requestParameters(parameters: [
                "station_name": stationName
            ], encoding: URLEncoding.queryString)

        case .fetchStationByStationName:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchRouteStationList, .fetchStationByStationName:
            return .accessToken
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .fetchRouteStationList:
            return [:]

        case .fetchStationByStationName:
            return [:]
        }
    }
}
