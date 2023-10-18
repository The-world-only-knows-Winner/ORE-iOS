import Foundation

public struct FetchMyRouteListResponseDTO: Decodable {
    public let routeList: [MyRouteResponseDTO]

    public init(routeList: [MyRouteResponseDTO]) {
        self.routeList = routeList
    }
}

public struct MyRouteResponseDTO: Decodable {
    public let routeId: String
    public let startName: String
    public let startXPoint: Float
    public let startYPoint: Float
    public let endName: String
    public let endXPoint: Float
    public let endYPoint: Float
    public let time: Int

    public init(
        routeId: String,
        startName: String,
        startXPoint: Float,
        startYPoint: Float,
        endName: String,
        endXPoint: Float,
        endYPoint: Float,
        time: Int
    ) {
        self.routeId = routeId
        self.startName = startName
        self.startXPoint = startXPoint
        self.startYPoint = startYPoint
        self.endName = endName
        self.endXPoint = endXPoint
        self.endYPoint = endYPoint
        self.time = time
    }
}
