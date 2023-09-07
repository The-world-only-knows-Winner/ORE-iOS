import SwiftUI

protocol ORIFontable {
    var size: Size { get }
    var weight: ORIFontWeight { get }
}

public struct Size {
    var fontSize: CGFloat
    var fontHeight: CGFloat
}

public enum ORIFontWeight: String {
    case bold = "Bold"
    case semiBold = "SemiBold"
    case medium = "Medium"
}

public enum ORIFontStyle: Hashable {
    case heading(ORIFontStyle.Heading)
    case body(ORIFontStyle.Body)

    public enum Heading: CGFloat, ORIFontable {
        case heading1
        case heading2
        case heading3
        var size: Size {
            switch self {
            case .heading1:
                return .init(fontSize: 22, fontHeight: 32)
            case .heading2, .heading3:
                return .init(fontSize: 18, fontHeight: 28)
            }
        }
    }

    public enum Body: CGFloat, ORIFontable {
        case body1
        case body2
        case body3
        case body4
        var size: Size {
            switch self {
            case .body1, .body2:
                return .init(fontSize: 16, fontHeight: 24)
            case .body3, .body4:
                return .init(fontSize: 14, fontHeight: 20)
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

// MARK: - Header
public extension ORIFontStyle.Heading {
    var weight: ORIFontWeight {
        switch self {
        case .heading1, .heading2: return .bold
        case .heading3: return .semiBold
        }
    }
}

// MARK: - Body
public extension ORIFontStyle.Body {
    var weight: ORIFontWeight {
        switch self {
        case .body1, .body3: return .semiBold
        case .body2, .body4: return .medium
        }
    }
}
