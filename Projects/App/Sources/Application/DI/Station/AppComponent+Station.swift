import NeedleFoundation
import StationDomain
import StationDomainInterface

public extension AppComponent {
    var remoteStationDataSource: any RemoteStationDataSource {
        shared {
            RemoteStationDataSourceImpl(keychain: keychain)
        }
    }

    var stationRepository: any StationRepository {
        shared {
            StationRepositoryImpl(remoteStationDataSource: remoteStationDataSource)
        }
    }

    var fetchBusStationUseCase: any FetchBusStationUseCase {
        shared {
            FetchBusStationUseCaseImpl(stationRepository: stationRepository)
        }
    }

    var fetchStationByStationNameUseCase: any FetchStationByStationNameUseCase {
        shared {
            FetchStationByStationNameUseCaseImpl(stationRepository: stationRepository)
        }
    }
}
