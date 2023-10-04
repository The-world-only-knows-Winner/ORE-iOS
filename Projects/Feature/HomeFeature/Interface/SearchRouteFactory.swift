import SwiftUI

public protocol SearchRouteFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
