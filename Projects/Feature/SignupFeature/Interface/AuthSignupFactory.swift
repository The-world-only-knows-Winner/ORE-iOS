import SwiftUI

public protocol AuthSignupFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
