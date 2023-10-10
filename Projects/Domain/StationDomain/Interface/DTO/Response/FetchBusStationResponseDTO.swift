import Foundation

public struct FetchBusStationResponseDTO: Decodable {
    public let stationList: [StationListResponseDTO]

    public init(stationList: [StationListResponseDTO]) {
        self.stationList = stationList
    }
}

public struct StationListResponseDTO: Decodable {
    public let stationName: String
    public let stationID, pointX, pointY: Int
    public let busInfo: [BusInfoResponseDTO]

    public init(
        stationName: String,
        stationID: Int,
        pointX: Int,
        pointY: Int,
        busInfo: [BusInfoResponseDTO]
    ) {
        self.stationName = stationName
        self.stationID = stationID
        self.pointX = pointX
        self.pointY = pointY
        self.busInfo = busInfo
    }

    enum CodingKeys: String, CodingKey {
        case stationName
        case stationID = "stationId"
        case pointX, pointY, busInfo
    }
}

public struct BusInfoResponseDTO: Decodable {
    public let busLocalID, busNo: String

    public init(busLocalID: String, busNo: String) {
        self.busLocalID = busLocalID
        self.busNo = busNo
    }

    enum CodingKeys: String, CodingKey {
        case busLocalID = "busLocalId"
        case busNo
    }
}
