import NeedleFoundation
import RouteDomain
import RouteDomainInterface

public extension AppComponent {
    var remoteRouteDataSource: any RemoteRouteDataSource {
        shared {
            RemoteRouteDataSourceImpl(keychain: keychain)
        }
    }

    var routeRepository: any RouteRepository {
        shared {
            RouteRepositoryImpl(remoteRouteDataSource: remoteRouteDataSource)
        }
    }

    var fetchRouteListUseCase: any FetchRouteListUseCase {
        shared {
            FetchRouteListUseCaseImpl(routeRepository: routeRepository)
        }
    }

    var addRouteUseCase: any AddRouteUseCase {
        shared {
            AddRouteUseCaseImpl(routeRepository: routeRepository)
        }
    }

    var fetchMyRouteListUseCase: any FetchMyRouteListUseCase {
        shared {
            FetchMyRouteListUseCaseImpl(routeRepository: routeRepository)
        }
    }
}
