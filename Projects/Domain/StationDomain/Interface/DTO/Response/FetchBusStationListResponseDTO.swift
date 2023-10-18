import Foundation

public struct FetchBusStationListResponseDTO: Decodable {
    public let stationList: [BusStationResponseDTO]

    public init(stationList: [BusStationResponseDTO]) {
        self.stationList = stationList
    }
}

public struct BusStationResponseDTO: Decodable {
    public let busNumber, stationName: String
    public let index, time: Int

    public init(busNumber: String, stationName: String, index: Int, time: Int) {
        self.busNumber = busNumber
        self.stationName = stationName
        self.index = index
        self.time = time
    }
}
