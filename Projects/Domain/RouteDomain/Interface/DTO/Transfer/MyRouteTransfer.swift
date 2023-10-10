import Foundation

public extension FetchMyRouteResponseDTO {
    func toDomain() -> MyRouteEntity {
        MyRouteEntity(routeList: routeList.map { $0.toDomain() })
    }
}

public extension MyRouteListResponseDTO {
    func toDomain() -> MyRouteListEntity {
        MyRouteListEntity(
            startName: startName,
            startXPoint: startXPoint,
            startYPoint: startYPoint,
            endName: endName,
            endXPoint: endXPoint,
            endYPoint: endYPoint,
            time: time
        )
    }
}
