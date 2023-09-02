import SwiftUI

public protocol OnboardingFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
