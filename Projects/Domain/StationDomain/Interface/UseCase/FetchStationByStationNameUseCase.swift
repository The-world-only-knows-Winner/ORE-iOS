import Combine

public protocol FetchStationByStationNameUseCase {
    func execute(routeID: String) -> AnyPublisher<StationByStationNameEntity, Error>
}
