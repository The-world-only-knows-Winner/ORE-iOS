import Foundation

public struct FetchMyRouteResponseDTO: Decodable {
    public let routeList: [MyRouteListResponseDTO]

    public init(routeList: [MyRouteListResponseDTO]) {
        self.routeList = routeList
    }
}

public struct MyRouteListResponseDTO: Decodable {
    public let startName: String
    public let startXPoint: Float
    public let startYPoint: Float
    public let endName: String
    public let endXPoint: Float
    public let endYPoint: Float
    public let time: Int

    public init(
        startName: String,
        startXPoint: Float,
        startYPoint: Float,
        endName: String,
        endXPoint: Float,
        endYPoint: Float,
        time: Int
    ) {
        self.startName = startName
        self.startXPoint = startXPoint
        self.startYPoint = startYPoint
        self.endName = endName
        self.endXPoint = endXPoint
        self.endYPoint = endYPoint
        self.time = time
    }
}
