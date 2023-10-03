import DesignSystem
import SwiftUI

struct RouteConfirmView: View {
    @StateObject var viewModel: RouteConfirmViewModel
    @Environment(\.rootPresentationMode) var rootPresentationMode

    init(
        viewModel: RouteConfirmViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
