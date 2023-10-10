import SwiftUI
import NeedleFoundation
import SplashFeatureInterface
import AuthDomainInterface

public protocol SplashDependency: Dependency {
    var tokenRefreshUseCase: any TokenRefreshUseCase { get }
}

public final class SplashComponent: Component<SplashDependency>, SplashFactory {
    public func makeView() -> some View {
        SplashView(
            viewModel: .init(
                tokenRefreshUseCase: dependency.tokenRefreshUseCase
            )
        )
    }
}
