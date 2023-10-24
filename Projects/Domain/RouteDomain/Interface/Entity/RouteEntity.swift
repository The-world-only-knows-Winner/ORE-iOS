import Foundation

public struct RouteEntity: Equatable {
    public let busCount: Int
    public let pathList: [PathEntity]

    public init(busCount: Int, pathList: [PathEntity]) {
        self.busCount = busCount
        self.pathList = pathList
    }
}

public struct PathEntity: Equatable, Hashable {
    public let pathInfo: PathInfoEntity
    public let subPathList: [SubPathEntity]

    public init(pathInfo: PathInfoEntity, subPathList: [SubPathEntity]) {
        self.pathInfo = pathInfo
        self.subPathList = subPathList
    }
}

public struct PathInfoEntity: Equatable, Hashable {
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

public struct SubPathEntity: Equatable, Hashable {
    public var id: UUID = UUID()
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
