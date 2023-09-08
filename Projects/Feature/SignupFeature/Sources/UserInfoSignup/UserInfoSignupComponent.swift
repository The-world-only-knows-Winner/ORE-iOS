import SwiftUI
import NeedleFoundation
import SignupFeatureInterface

public protocol UserInfoSignupDependency: Dependency {}

public final class UserInfoSignupComponent: Component<UserInfoSignupDependency>, UserInfoSignupFactory {
    public func makeView() -> some View {
        UserInfoSignupView(viewModel: .init())
    }
}
