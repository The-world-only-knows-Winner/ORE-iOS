import SwiftUI

protocol ORIFontable {
    var size: CGFloat { get }
}

public enum ORIFontWeight: String {
    case bold = "Bold"
    case semiBold = "SemiBold"
    case medium = "Medium"
}

public enum ORIFontStyle: Hashable {
    case heading(ORIFontStyle.Heading, weight: ORIFontWeight)
    case body(ORIFontStyle.Body, weight: ORIFontWeight)

    public enum Heading: CGFloat, ORIFontable {
        case heading1
        case heading2
        var size: CGFloat {
            switch self {
            case .heading1: return 22
            case .heading2: return 18
            }
        }
    }
    public enum Body: CGFloat, ORIFontable {
        case body1
        case body2
        var size: CGFloat {
            switch self {
            case .body1: return 16
            case .body2: return 14
            }
        }
    }
}

// MARK: - FontableSize
extension ORIFontable where Self: RawRepresentable, Self.RawValue == CGFloat {
    var size: CGFloat {
        self.rawValue
    }
}
