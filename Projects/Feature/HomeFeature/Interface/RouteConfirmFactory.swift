import SwiftUI

public protocol RouteConfirmFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
