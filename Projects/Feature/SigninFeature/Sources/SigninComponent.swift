import SwiftUI
import NeedleFoundation
import SigninFeatureInterface
import AuthDomainInterface

public protocol SigninDependency: Dependency {
    var signinUseCase: any SigninUseCase { get }
}

public final class SigninComponent: Component<SigninDependency>, SigninFactory {
    public func makeView() -> some View {
        SigninView(
            viewModel: .init(signinUseCase: dependency.signinUseCase)
        )
    }
}
