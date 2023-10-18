import Foundation

public extension FetchRouteResponseDTO {
    func toDomain() -> RouteEntity {
        RouteEntity(
            busCount: routeList.busCount,
            pathList: routeList.pathList.map { $0.toDomain() }
        )
    }
}

public extension PathResponseDTO {
    func toDomain() -> PathEntity {
        PathEntity(
            pathInfo: pathInfo.toDomain(),
            subPathList: subPathList.map { $0.toDomain() }
        )
    }
}

public extension PathInfoResponseDTO {
    func toDomain() -> PathInfoEntity {
        PathInfoEntity(
            totalTime: totalTime,
            busTransitCount: busTransitCount,
            firstStartStation: firstStartStation,
            lastEndStation: lastEndStation
        )
    }
}

public extension SubPathResponseDTO {
    func toDomain() -> SubPathEntity {
        SubPathEntity(
            trafficType: trafficType,
            sectionTime: sectionTime,
            busNo: busNo,
            startName: startName,
            startXPoint: startXPoint,
            startYPoint: startYPoint,
            endName: endName,
            endXPoint: endXPoint,
            endYPoint: endYPoint
        )
    }
}
