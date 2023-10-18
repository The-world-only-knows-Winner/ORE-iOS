import Foundation

public extension FetchBusStationListResponseDTO {
    func toDomain() -> [BusStationEntity] {
        stationList.map {
            BusStationEntity(
                busNumber: $0.busNumber,
                stationName: $0.stationName,
                index: $0.index,
                time: $0.time
            )
        }
    }
}
