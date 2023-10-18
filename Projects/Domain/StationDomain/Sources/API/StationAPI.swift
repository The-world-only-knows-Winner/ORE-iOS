import Moya
import StationDomainInterface
import BaseDomain

public enum StationAPI {
    case fetchStationListByStationName(stationName: String)
    case fetchBusStationList(routeID: String)
}

extension StationAPI: JobisAPI {
    public typealias ErrorType = Error

    public var domain: JobisDomain {
        .station
    }

    public var urlPath: String {
        switch self {
        case .fetchStationListByStationName:
            return ""

        case let .fetchBusStationList(routeID):
            return "/\(routeID)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchStationListByStationName, .fetchBusStationList:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case let .fetchStationListByStationName(stationName):
            return .requestParameters(parameters: [
                "station_name": stationName
            ], encoding: URLEncoding.queryString)

        case .fetchBusStationList:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchStationListByStationName, .fetchBusStationList:
            return .accessToken
        }
    }

    public var errorMap: [Int: ErrorType] {
        switch self {
        case .fetchStationListByStationName:
            return [:]

        case .fetchBusStationList:
            return [:]
        }
    }
}
