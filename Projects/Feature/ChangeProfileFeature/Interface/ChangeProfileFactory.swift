import SwiftUI

public protocol ChangeProfileFactory {
    associatedtype SomeView: View
    func makeView(name: String, birthday: String) -> SomeView
}
