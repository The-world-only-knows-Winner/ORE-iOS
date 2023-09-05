import SwiftUI

protocol ORIFontable {
    var size: CGFloat { get }
    var weight: ORIFontWeight { get }
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
        case heading1_Bold
        case heading2_Bold
        case heading2_SemiBold
        var size: CGFloat {
            switch self {
            case .heading1_Bold: return 22
            case .heading2_Bold, .heading2_SemiBold: return 18
            }
        }
    }
    public enum Body: CGFloat, ORIFontable {
        case body1_SemiBold
        case body1_Medium
        case body2_SemiBold
        case body2_Medium
        var size: CGFloat {
            switch self {
            case .body1_SemiBold, .body1_Medium: return 16
            case .body2_SemiBold, .body2_Medium: return 14
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

// MARK: - Heading
public extension ORIFontStyle.Heading {
    var weight: ORIFontWeight {
        switch self {
        case .heading1_Bold, .heading2_Bold:
            return .bold
        case .heading2_SemiBold:
            return .semiBold
        }
    }
}

// MARK: - Text
public extension ORIFontStyle.Body {
    var weight: ORIFontWeight {
        switch self {
        case .body1_SemiBold, .body2_SemiBold:
            return .semiBold
        case .body1_Medium, .body2_Medium:
            return .medium
        }
    }
}
