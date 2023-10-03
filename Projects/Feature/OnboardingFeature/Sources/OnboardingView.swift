import DesignSystem
import SwiftUI
import BaseFeature
import SigninFeatureInterface
import SignupFeatureInterface

struct OnboardingView: View {
    @Environment(\.colorScheme) var scheme
    @StateObject var viewModel: OnboardingViewModel

    private let signinFactory: any SigninFactory
    private let signupFactory: any AuthSignupFactory

    init(
        viewModel: OnboardingViewModel,
        signinFactory: any SigninFactory,
        authSignupFactory: any AuthSignupFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signinFactory = signinFactory
        self.signupFactory = authSignupFactory
    }

    var body: some View {
        ORINavigationBar(
            headerTitle: ""
        ) {
            VStack(spacing: 12) {
                TabView(selection: $viewModel.pageIndex) {
                    ForEach(0..<viewModel.onboardings.count, id: \.self) { index in
                        let image = viewModel.onboardings[index].image
                        
                        ORIImage(image)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .tag(index)
                            .background(
                                GeometryReader { proxy in
                                    Color.clear.onAppear {
                                        viewModel.imageHeight = proxy.size.height
                                    }
                                }
                            )
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(.page(backgroundDisplayMode: .never))
                .frame(maxHeight: viewModel.imageHeight)
                
                HStack(spacing: 8) {
                    ForEach(0..<viewModel.onboardings.count, id: \.self) { index in
                        let isSameIndex: Bool = index == viewModel.pageIndex
                        
                        Capsule()
                            .fill(isSameIndex ? Color.Primary.primary300 : .GrayScale.gray300)
                            .frame(width: isSameIndex ? 24 : 8, height: 8)
                            .animation(
                                .spring(
                                    response: 0.5,
                                    dampingFraction: 0.7,
                                    blendDuration: 1
                                ),
                                value: viewModel.pageIndex
                            )
                            .onTapGesture {
                                viewModel.pageIndex = index
                            }
                    }
                }
                
                VStack(spacing: 8) {
                    let onboardingText = viewModel.onboardings[viewModel.pageIndex]
                    
                    Text(onboardingText.title)
                        .oriFont(.heading(.heading2), color: .GrayScale.gray700)
                    
                    Text(onboardingText.content)
                        .oriFont(.body(.body3), color: .GrayScale.gray500)
                }
                .padding(.top, 12)
                
                Spacer()
                
                VStack(spacing: 0) {
                    ORIButton(text: "새 계정으로 시작하기", style: .default) {
                        viewModel.isNavigatedToSignup.toggle()
                    }
                    
                    Button {
                        viewModel.isNavigatedToSignin.toggle()
                    } label: {
                        Text("기존 계정으로 계속하기")
                            .oriFont(.body(.body3), color: .GrayScale.gray500)
                            .underlineText(color: .GrayScale.gray500)
                            .padding(8)
                    }
                }
            }
            .navigate(to: signinFactory.makeView().eraseToAnyView(), when: $viewModel.isNavigatedToSignin)
            .navigate(to: signupFactory.makeView().eraseToAnyView(), when: $viewModel.isNavigatedToSignup)
        } 
    }
}
