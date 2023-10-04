import BaseFeature
import Combine

final class ConfirmViewModel: BaseViewModel {
    @Published var isNavigatedToSetAlarm = false
    @Published var isNavigatedToConfirmRoute = false
    @Published var isNavigatedToSuccessSelectRoute = false
}
