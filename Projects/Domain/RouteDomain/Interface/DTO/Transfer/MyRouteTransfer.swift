import Foundation

public extension FetchMyRouteListResponseDTO {
    func toDomain() -> [MyRouteEntity] {
        routeList.map {
            MyRouteEntity(
                routeId: $0.routeId,
                startName: $0.startName,
                startXPoint: $0.startXPoint,
                startYPoint: $0.startYPoint,
                endName: $0.endName,
                endXPoint: $0.endXPoint,
                endYPoint: $0.endYPoint,
                time: $0.time
            )
        }
    }
}
