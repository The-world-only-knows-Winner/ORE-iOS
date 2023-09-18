import SwiftUI

enum TimelineType {
    case head
    case body
    case tail

    var topHeight: CGFloat {
        switch self {
        case .head: return 20
        case .body: return 34
        case .tail: return 48
        }
    }

    var bottomHeight: CGFloat {
        switch self {
        case .head: return 48
        case .body: return 34
        case .tail: return 20
        }
    }
}
