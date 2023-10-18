import Foundation

public struct FetchStationListByStationNameResponseDTO: Decodable {
    public let stationList: [StationResponseDTO]

    public init(stationList: [StationResponseDTO]) {
        self.stationList = stationList
    }
}

public struct StationResponseDTO: Decodable {
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
