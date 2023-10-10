import Foundation

public struct StationByStationNameEntity: Equatable {
    public let stationList: [StationListByStationNameEntity]

    public init(stationList: [StationListByStationNameEntity]) {
        self.stationList = stationList
    }
}

public struct StationListByStationNameEntity: Equatable {
    public let busNumber, stationName: String
    public let index, time: Int

    public init(busNumber: String, stationName: String, index: Int, time: Int) {
        self.busNumber = busNumber
        self.stationName = stationName
        self.index = index
        self.time = time
    }
}
