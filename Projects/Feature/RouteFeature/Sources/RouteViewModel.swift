import BaseFeature
import RouteFeatureInterface
import CoreLocation

final class RouteViewModel: BaseViewModel {
    @Published var startPoint: String?
    @Published var endPoint: String?

    @Published var buttonType: LocationType? = .start

    func nextButtonDidTap() {
        switch buttonType {
        case .start:
            if endPoint == nil {
                buttonType = .end
            } else {
                buttonType = .none
            }
        case .end:
            buttonType = .none
        case nil:
            print("let's go!!")
        }
    }
}
