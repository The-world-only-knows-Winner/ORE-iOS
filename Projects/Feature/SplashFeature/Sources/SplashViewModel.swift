import BaseFeature
import Combine
import AuthDomainInterface

final class SplashViewModel: BaseViewModel {
    private let tokenRefreshUseCase: any TokenRefreshUseCase

    public init(
        tokenRefreshUseCase: any TokenRefreshUseCase
    ) {
        self.tokenRefreshUseCase = tokenRefreshUseCase
    }

    func onAppear(
        onSuccess: @escaping () -> Void,
        onError: @escaping (Error) -> Void
    ) {
        addCancellable(
            tokenRefreshUseCase.execute()
        ) { _ in
            onSuccess()
        } onReceiveError: { error in
            onError(error)
        }
    }
}
