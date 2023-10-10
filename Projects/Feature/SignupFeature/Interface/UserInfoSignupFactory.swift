import SwiftUI

public protocol UserInfoSignupFactory {
    associatedtype SomeView: View
    func makeView(email: String, password: String) -> SomeView
}
