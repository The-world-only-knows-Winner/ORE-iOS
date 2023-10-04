import DesignSystem
import SwiftUI

struct SearchRouteView: View {
    @StateObject var viewModel: SearchRouteViewModel

    init(
        viewModel: SearchRouteViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
