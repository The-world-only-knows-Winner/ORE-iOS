import BaseFeature
import CoreLocation
import Combine

final class RouteViewModel: BaseViewModel {
    @Published var startPoint: String?
    @Published var endPoint: String?
}
