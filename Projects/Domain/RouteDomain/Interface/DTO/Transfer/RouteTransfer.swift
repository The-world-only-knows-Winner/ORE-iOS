import Foundation

public extension FetchRouteResponseDTO {
    func toDomain() -> RouteEntity {
        RouteEntity(routeList: routeList.toDomain())
    }
}

public extension RouteListResponseDTO {
    func toDomain() -> RouteListEntity {
        RouteListEntity(busCount: busCount, pathList: pathList.map { $0.toDomain() })
    }
}

public extension PathListResponseDTO {
    func toDomain() -> PathListEntity {
        PathListEntity(
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

public extension SubPathListResponseDTO {
    func toDomain() -> SubPathListEntity {
        SubPathListEntity(
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
