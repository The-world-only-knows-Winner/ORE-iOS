import Foundation

public struct RouteEntity: Equatable {
    public let routeList: RouteListEntity

    public init(routeList: RouteListEntity) {
        self.routeList = routeList
    }
}

public struct RouteListEntity: Equatable {
    public let busCount: Int
    public let pathList: [PathListEntity]

    public init(busCount: Int, pathList: [PathListEntity]) {
        self.busCount = busCount
        self.pathList = pathList
    }
}

public struct PathListEntity: Equatable {
    public let pathInfo: PathInfoEntity
    public let subPathList: [SubPathListEntity]

    public init(pathInfo: PathInfoEntity, subPathList: [SubPathListEntity]) {
        self.pathInfo = pathInfo
        self.subPathList = subPathList
    }
}

public struct PathInfoEntity: Equatable {
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

public struct SubPathListEntity: Equatable {
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
