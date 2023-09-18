import DesignSystem
import SwiftUI

struct RouteView: View {
    @StateObject var manager = LocationManager()
    @StateObject var viewModel: RouteViewModel
    @Environment(\.dismiss) private var dismiss

    init(
        viewModel: RouteViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            MapViewCoordinator(locationManager: manager)
                .ignoresSafeArea(edges: .bottom)

            VStack(alignment: .trailing, spacing: 20) {
                HStack(spacing: 16) {
                    location(viewModel.startPoint)

                    ORIIcon(.arrowForward)
                        .frame(width: 24, height: 24)

                    location(viewModel.endPoint)
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .oriBackground()

                Spacer()

                Button {
                    withAnimation(.spring()) {
                        manager.mapViewFocusChange()
                    }
                } label: {
                    ORIIcon(.myLocation)
                        .frame(width: 32, height: 32)
                        .padding(8)
                        .background(Color.GrayScale.gray100)
                        .clipShape(Circle())
                        .shadow(color: .black, opacity: 0.1, blur: 16)
                        .padding(.trailing, 20)
                }

                if viewModel.startPoint == nil || viewModel.endPoint == nil {
                    VStack(alignment: .leading, spacing: 0) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(manager.title)
                                .oriFont(.heading(.heading2), color: .GrayScale.gray700)

                            Text(manager.subTitle)
                                .oriFont(.body(.body1), color: .GrayScale.gray700)
                        }
                        .padding(.vertical, 16)

                        HStack(spacing: 10) {
                            ORIButton(text: "출발지로 지정", style: .default, isSmall: true) {
                                viewModel.startPoint = manager.title
                            }

                            ORIButton(text: "도착지로 지정", style: .sub, isSmall: true) {
                                viewModel.endPoint = manager.title
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .oriBackground()
                } else {
                    ORIButton(text: "설정완료") {
                        // 설정완료
                    }
                    .padding(.vertical, 4)
                    .oriBackground()
                }
            }

            ORIIcon(.pinLocation)
                .frame(width: 32, height: 48, alignment: .bottom)
                .shadow(color: .black, opacity: 0.25, blur: 12)
        }
        .onAppear { manager.configureLocationManager() }
        .oriNavigationBar(
            leadingItem: NavigationItem(image: ORIIcon(.arrowBack)) { dismiss() },
            trailingItem: NavigationItem(image: ORIIcon(.search)) { print("검색으로 이동") },
            headerTitle: "장소지정"
        )
    }

    @ViewBuilder
    func location(_ text: String?) -> some View {
        let textIsNil = text == nil
        HStack(spacing: 4) {
            ZStack(alignment: .top) {
                ORIIcon(.location, renderingMode: .template)
                    .foregroundColor(textIsNil ? .GrayScale.gray400 : .Primary.primary300)
                    .frame(width: 24, height: 24)

                Circle()
                    .fill(Color.GrayScale.gray100)
                    .frame(width: 8, height: 8)
                    .padding(.top, 5)
            }

            Text(text ?? "출발지 미지정")
                .oriFont(
                    textIsNil ? .body(.body4) : .body(.body3),
                    color: textIsNil ? .GrayScale.gray500 : .GrayScale.gray700
                )

            Spacer()
        }
    }
}
