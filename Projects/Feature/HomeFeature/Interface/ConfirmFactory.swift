import SwiftUI

public protocol ConfirmFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
