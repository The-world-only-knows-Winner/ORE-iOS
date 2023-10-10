import Foundation

public extension FetchStationByStationNameResponseDTO {
    func toDomain() -> StationByStationNameEntity {
        StationByStationNameEntity(stationList: stationList.map { $0.toDomain() })
    }
}

public extension StationListByStationNameResponseDTO {
    func toDomain() -> StationListByStationNameEntity {
        StationListByStationNameEntity(
            busNumber: busNumber,
            stationName: stationName,
            index: index,
            time: time
        )
    }
}
