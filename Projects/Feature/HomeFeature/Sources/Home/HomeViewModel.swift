import BaseFeature
import Combine

final class HomeViewModel: BaseViewModel {
    @Published var isNavigatedToMyPage = false
    @Published var isNavigatedToRoute = false
    @Published var segmentSelection = 0
    @Published var allRouteList = [0, 1, 2, 3, 4, 5]
    @Published var starRouteList = [Int]()
}
