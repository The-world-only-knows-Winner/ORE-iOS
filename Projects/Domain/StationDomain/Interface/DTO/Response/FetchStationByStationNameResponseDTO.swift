import Foundation

public struct FetchStationByStationNameResponseDTO: Decodable {
    public let stationList: [StationListByStationNameResponseDTO]

    public init(stationList: [StationListByStationNameResponseDTO]) {
        self.stationList = stationList
    }
}

public struct StationListByStationNameResponseDTO: Decodable {
    public let busNumber, stationName: String
    public let index, time: Int

    public init(busNumber: String, stationName: String, index: Int, time: Int) {
        self.busNumber = busNumber
        self.stationName = stationName
        self.index = index
        self.time = time
    }
}
