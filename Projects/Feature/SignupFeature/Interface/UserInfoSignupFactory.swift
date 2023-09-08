import SwiftUI

public protocol UserInfoSignupFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
