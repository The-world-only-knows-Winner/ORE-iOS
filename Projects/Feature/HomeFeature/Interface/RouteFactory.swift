import SwiftUI

public protocol RouteFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
