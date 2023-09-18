import SwiftUI
import NeedleFoundation
import ChangeProfileFeatureInterface

public protocol ChangeProfileDependency: Dependency {}

public final class ChangeProfileComponent: Component<ChangeProfileDependency>, ChangeProfileFactory {
    public func makeView() -> some View {
        ChangeProfileView(viewModel: .init())
    }
}

