import SwiftUI
import NeedleFoundation
import HomeFeatureInterface

public protocol ConfirmDependency: Dependency {}

public final class ConfirmComponent: Component<ConfirmDependency>, ConfirmFactory {
    public func makeView() -> some View {
        SelectRouteView(viewModel: .init())
    }
}
