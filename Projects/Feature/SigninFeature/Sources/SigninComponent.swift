import SwiftUI
import NeedleFoundation
import SigninFeatureInterface
import SignupFeatureInterface

public protocol SigninDependency: Dependency {
}

public final class SigninComponent: Component<SigninDependency>, SigninFactory {
    public func makeView() -> some View {
        SigninView(
            viewModel: .init()
        )
    }
}
