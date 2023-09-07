import Foundation
import BaseFeature
import Combine
import SwiftUI
import DesignSystem

final class OnboardingViewModel: BaseViewModel {
    @Published var pageIndex: Int = 0
    @Published var imageHeight: CGFloat = .infinity
    @Published var isNavigatedToSignin: Bool = false
    @Published var isNavigatedToSignup: Bool = false

    struct Onboarding {
        let title: String
        let content: String
        let image: ORIImage.Image
    }
    public let onboardings: [Onboarding] = [
        .init(
            title: "폰 보다가 버스 놓친 적 있으시죠?",
            content: "버스를 놓쳐 스트레스받는 일이 한두 번이 아니죠.",
            image: .onboarding1
        ),
        .init(
            title: "더 이상 그럴 일은 없을 거예요!",
            content: "이젠 그럴 일 없게 오리가 알려드릴게요!",
            image: .oriIcon
        ),
        .init(
            title: "타는 대중교통을 설정만 해두세요",
            content: "오리 앱에서 타는 대중교통들을 설정해 주세요.",
            image: .onboarding3
        ),
        .init(
            title: "오리가 알림으로 알려드릴게요!",
            content: "대중교통이 왔을 때 오리가 알려드릴게요!",
            image: .onboarding4
        )
    ]
}
