import Foundation

public extension FetchBusStationResponseDTO {
    func toDomain() -> BusStationEntity {
        BusStationEntity(stationList: stationList.map { $0.toDomain() })
    }
}

public extension StationListResponseDTO {
    func toDomain() -> StationListEntity {
        StationListEntity(
            stationName: stationName,
            stationID: stationID,
            pointX: pointX,
            pointY: pointY,
            busInfo: busInfo.map { $0.toDomain() }
        )
    }
}

public extension BusInfoResponseDTO {
    func toDomain() -> BusInfoEntity {
        BusInfoEntity(busLocalID: busLocalID, busNo: busNo)
    }
}
