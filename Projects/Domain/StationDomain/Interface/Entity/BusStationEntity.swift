import Foundation

public struct BusStationEntity: Equatable {
    public let stationList: [StationListEntity]

    public init(stationList: [StationListEntity]) {
        self.stationList = stationList
    }
}

public struct StationListEntity: Equatable {
    public let stationName: String
    public let stationID, pointX, pointY: Int
    public let busInfo: [BusInfoEntity]

    public init(
        stationName: String,
        stationID: Int,
        pointX: Int,
        pointY: Int,
        busInfo: [BusInfoEntity]
    ) {
        self.stationName = stationName
        self.stationID = stationID
        self.pointX = pointX
        self.pointY = pointY
        self.busInfo = busInfo
    }
}

public struct BusInfoEntity: Equatable {
    public let busLocalID, busNo: String

    public init(busLocalID: String, busNo: String) {
        self.busLocalID = busLocalID
        self.busNo = busNo
    }
}
