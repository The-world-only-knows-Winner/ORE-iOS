import DesignSystem
import HomeFeatureInterface
import SwiftUI

struct RouteView: View {
    @StateObject var manager = LocationManager()
    @StateObject var viewModel: RouteViewModel
    @Environment(\.rootPresentationMode) var rootPresentationMode
    @Environment(\.dismiss) private var dismiss

    private let confirmFactory: any ConfirmFactory

    init(
        viewModel: RouteViewModel,
        confirmFactory: any ConfirmFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.confirmFactory = confirmFactory
    }

    var body: some View {
        ORINavigationBar(
            leadingItem: NavigationItem(image: ORIIcon(.arrowBack)) { dismiss() },
            trailingItem: NavigationItem(image: ORIIcon(.search)) { print("검색으로 이동") }
        ) {
            VStack(alignment: .trailing, spacing: 0) {
                HStack(spacing: 16) {
                    location(viewModel.startPoint, type: .start)

                    ORIIcon(.arrowForward)
                        .frame(width: 24, height: 24)

                    location(viewModel.endPoint, type: .end)
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .oriBackground()

                ZStack(alignment: .bottomTrailing) {
                    ZStack {
                        MapViewCoordinator(locationManager: manager)
                            .ignoresSafeArea(edges: .bottom)

                        ORIIcon(.myPin)
                            .frame(width: 32, height: 48, alignment: .bottom)
                            .shadow(color: .black, opacity: 0.25, blur: 12)
                    }

                    Button {
                        withAnimation(.spring()) {
                            manager.locationManagerDidChangeAuthorization()
                        }
                    } label: {
                        ORIIcon(.myLocation)
                            .frame(width: 32, height: 32)
                            .padding(8)
                            .background(Color.GrayScale.gray100)
                            .clipShape(Circle())
                            .shadow(color: .black, opacity: 0.1, blur: 16)
                            .padding(20)
                    }
                }

                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(manager.title)
                            .oriFont(.heading(.heading2), color: .GrayScale.gray700)

                        Text(manager.subTitle)
                            .oriFont(.body(.body1), color: .GrayScale.gray700)
                    }
                    .padding(.vertical, 16)

                    switch viewModel.buttonType {
                    case .start:
                        ORIButton(text: "출발지로 지정", style: .default, isPadding: false) {
                            withAnimation {
                                viewModel.selectPosition(point: manager.title, type: .start)
                                manager.addPin(type: .start)
                            }
                        }
                    case .end:
                        ORIButton(text: "도착지로 지정", style: .default, isPadding: false) {
                            withAnimation {
                                viewModel.selectPosition(point: manager.title, type: .end)
                                manager.addPin(type: .end)
                            }
                        }
                    case .none:
                        HStack(spacing: 10) {
                            ORIButton(text: "설정 완료", style: .default, isPadding: false) {
                                withAnimation {
                                    viewModel.selectPosition()
                                }
                            }

                            smallButton(type: .start) {
                                withAnimation {
                                    viewModel.selectPosition(point: manager.title, type: .start)
                                    manager.addPin(type: .start)
                                }
                            }

                            smallButton(type: .end) {
                                withAnimation {
                                    viewModel.selectPosition(point: manager.title, type: .end)
                                    manager.addPin(type: .end)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .oriBackground()
            }
            .onAppear { manager.configureLocationManager() }
            .navigate(
                to: confirmFactory.makeView().eraseToAnyView()
                    .environment(\.rootPresentationMode, rootPresentationMode),
                when: $viewModel.isNavigatedToConfirmRoute
            )
        }
    }

    @ViewBuilder
    func smallButton(type: LocationType, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Group {
                switch type {
                case .start:
                    ORIIcon(.startPosition)
                case .end:
                    ORIIcon(.endPosition)
                }
            }
            .frame(width: 32, height: 32)
            .padding(8)
            .background(Color.Primary.primary100)
            .cornerRadius(12)
        }
    }

    @ViewBuilder
    func location(_ text: String?, type: LocationType) -> some View {
        let textIsNil = (text == nil)
        var icon: ORIIcon.Image {
            switch type {
            case .start:
                return textIsNil ? .startPositionOff : .startPosition
            case .end:
                return textIsNil ? .endPositionOff : .endPosition
            }
        }

        HStack(spacing: 4) {
            ORIIcon(icon)
                .frame(width: 24, height: 24)

            Text(text ?? "출발지 미지정")
                .oriFont(
                    textIsNil ? .body(.body4) : .body(.body3),
                    color: textIsNil ? .GrayScale.gray500 : .GrayScale.gray700
                )

            Spacer()
        }
    }
}
