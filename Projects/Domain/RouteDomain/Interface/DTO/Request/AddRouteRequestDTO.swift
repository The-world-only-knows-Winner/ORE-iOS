import Foundation

public struct AddRouteRequestDTO: Encodable {
    public let startName: String
    public let startXPoint: Float
    public let startYPoint: Float
    public let endName: String
    public let endXPoint: Float
    public let endYPoint: Float
    public let totalTime: Int
    public let subStationList: SubStationListRequestDTO
}

public struct SubStationListRequestDTO: Encodable {
    public let busNumber: String
    public let stationName: String
    public let index: Int
    public let sectionTime: Int
}
