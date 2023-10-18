import Foundation

public struct FetchRouteResponseDTO: Decodable {
    public let routeList: RouteResponseDTO

    public init(routeList: RouteResponseDTO) {
        self.routeList = routeList
    }
}

public struct RouteResponseDTO: Decodable {
    public let busCount: Int
    public let pathList: [PathResponseDTO]

    public init(busCount: Int, pathList: [PathResponseDTO]) {
        self.busCount = busCount
        self.pathList = pathList
    }
}

public struct PathResponseDTO: Decodable {
    public let pathInfo: PathInfoResponseDTO
    public let subPathList: [SubPathResponseDTO]

    public init(pathInfo: PathInfoResponseDTO, subPathList: [SubPathResponseDTO]) {
        self.pathInfo = pathInfo
        self.subPathList = subPathList
    }
}

public struct PathInfoResponseDTO: Decodable {
    public let totalTime, busTransitCount: Int
    public let firstStartStation, lastEndStation: String

    public init(
        totalTime: Int,
        busTransitCount: Int,
        firstStartStation: String,
        lastEndStation: String
    ) {
        self.totalTime = totalTime
        self.busTransitCount = busTransitCount
        self.firstStartStation = firstStartStation
        self.lastEndStation = lastEndStation
    }
}

public struct SubPathResponseDTO: Decodable {
    public let trafficType: TrafficType
    public let sectionTime: Int
    public let busNo, startName: String
    public let startXPoint, startYPoint: Float
    public let endName: String
    public let endXPoint, endYPoint: Float

    public init(
        trafficType: TrafficType,
        sectionTime: Int,
        busNo: String,
        startName: String,
        startXPoint: Float,
        startYPoint: Float,
        endName: String,
        endXPoint: Float,
        endYPoint: Float
    ) {
        self.trafficType = trafficType
        self.sectionTime = sectionTime
        self.busNo = busNo
        self.startName = startName
        self.startXPoint = startXPoint
        self.startYPoint = startYPoint
        self.endName = endName
        self.endXPoint = endXPoint
        self.endYPoint = endYPoint
    }
}
