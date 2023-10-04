import BaseFeature
import HomeFeatureInterface
import CoreLocation

final class RouteViewModel: BaseViewModel {
    @Published var startPoint: String?
    @Published var endPoint: String?
    @Published var isNavigatedToConfirmRoute: Bool = false
    @Published var isNavigatedToSearchRoute: Bool = false

    @Published var buttonType: LocationType? = .start

    func selectPosition(point: String = "", type: LocationType? = .none) {
        switch buttonType {
        case .start:
            buttonType = .end
        case .end:
            buttonType = .none
        case .none:
            break
        }

        patchPoint()

        func patchPoint() {
            switch type {
            case .start:
                startPoint = point
            case .end:
                endPoint = point
            case nil:
                self.isNavigatedToConfirmRoute.toggle()
            }
        }
    }
}
