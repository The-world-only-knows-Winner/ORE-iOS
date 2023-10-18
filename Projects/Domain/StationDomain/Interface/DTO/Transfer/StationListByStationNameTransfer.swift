import Foundation

public extension FetchStationListByStationNameResponseDTO {
    func toDomain() -> [StationByStationNameEntity] {
        stationList.map {
            StationByStationNameEntity(
                stationName: $0.stationName,
                stationID: $0.stationID,
                pointX: $0.pointX,
                pointY: $0.pointY,
                busInfo: $0.busInfo.map { $0.toDomain() }
            )
        }
    }
}

public extension BusInfoResponseDTO {
    func toDomain() -> BusInfoEntity {
        BusInfoEntity(busLocalID: busLocalID, busNo: busNo)
    }
}
