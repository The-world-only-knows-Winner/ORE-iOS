import DesignSystem
import MyPageFeatureInterface
import RenewalPasswordFeatureInterface
import ChangeProfileFeatureInterface
import SwiftUI
import UtilityModule
import BaseFeature

struct MyPageView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: MyPageViewModel
    @Environment(\.dismiss) var dismiss

    private let renewalPasswordFactory: any RenewalPasswordFactory
    private let changeProfileFactory: any ChangeProfileFactory

    init(
        viewModel: MyPageViewModel,
        renewalPasswordFactory: any RenewalPasswordFactory,
        changeProfileFactory: any ChangeProfileFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.renewalPasswordFactory = renewalPasswordFactory
        self.changeProfileFactory = changeProfileFactory
    }

    var body: some View {
        ORINavigationBar(
            leadingItem: NavigationItem(image: ORIIcon(.arrowBack)) { dismiss() },
            pageTitle: "마이페이지"
        ) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("홍길동")
                            .oriFont(.heading(.heading2), color: .GrayScale.gray700)

                        Text("2006.03.04")
                            .oriFont(.body(.body3), color: .GrayScale.gray700)
                    }

                    Spacer()

                    Text("수정")
                        .oriFont(.body(.body3), color: .Primary.primary300)
                        .onTapGesture {
                            viewModel.isNavigatedToChangeProfile.toggle()
                        }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)

                Rectangle().fill(Color.GrayScale.gray200).frame(maxWidth: .infinity, maxHeight: 12)

                VStack(alignment: .leading, spacing: 0) {
                    Text("기타")
                        .oriFont(.body(.body4), color: .GrayScale.gray500)
                        .padding(.vertical, 8)

                    Group {
                        HStack {
                            navigateText(
                                "알림 ON / OFF",
                                icon: viewModel.isNotificationsActive ?
                                    .notificationsActive :
                                        .notificationsOff
                            ) {
                                viewModel.isNotificationsActive.toggle()
                            }

                            ORIToggle(isOn: $viewModel.isNotificationsActive)
                        }

                        navigateText("교통카드 사용 내역", icon: .receiptLong) {
                            viewModel.isNavigatedToBusLog.toggle()
                        }
                    }
                    .padding(.vertical, 12)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .overlay(
                    Rectangle()
                        .fill(Color.GrayScale.gray200)
                        .frame(height: 1),
                    alignment: .bottom
                )

                VStack(alignment: .leading, spacing: 0) {
                    Text("계정")
                        .oriFont(.body(.body4), color: .GrayScale.gray500)
                        .padding(.vertical, 8)

                    Group {
                        navigateText("비밀번호 재설정", icon: .lock) {
                            viewModel.isNavigatedToRenewalPassword.toggle()
                        }

                        navigateText("로그아웃", icon: .logout) {
                            viewModel.isShowingLogoutAlert.toggle()
                        }
                    }
                    .padding(.vertical, 12)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .overlay(
                    Rectangle()
                        .fill(Color.GrayScale.gray200)
                        .frame(height: 1),
                    alignment: .bottom
                )

                Spacer()
            }
            .navigate(to: SuccessLogoutView(), when: $viewModel.isNavigatedToLogout)
            .navigate(
                to: changeProfileFactory.makeView().eraseToAnyView(),
                when: $viewModel.isNavigatedToChangeProfile
            )
            .navigate(
                to: renewalPasswordFactory.makeView().eraseToAnyView(),
                when: $viewModel.isNavigatedToRenewalPassword
            )
            .oriAlert(
                isPresented: $viewModel.isShowingLogoutAlert,
                type: .logout
            ) {
                viewModel.isNavigatedToLogout.toggle()
            }
        }
    }

    @ViewBuilder
    func navigateText(
        _ text: String,
        icon: ORIIcon.Image,
        action: @escaping () -> Void
    ) -> some View {
        Button {
            action()
        } label: {
            HStack(spacing: 8) {
                ORIIcon(icon)
                    .frame(width: 24, height: 24)

                Text(text)
                    .oriFont(.body(.body2), color: .GrayScale.gray600)

                Spacer()
            }
        }
    }
}
