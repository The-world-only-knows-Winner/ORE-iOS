import SwiftUI

public enum ORIAlertType: String {
    struct AlertButtonColor {
        var foregroundColor: Color
        var backgroundColor: Color
    }

    case logout = "로그아웃"
    case renewalPassword = "확인"

    var title: String {
        switch self {
        case .logout:
            return "정말 로그아웃 하시겠어요?"
        case .renewalPassword:
            return "비밀번호를 수정하시겠어요?"
        }
    }

    var contents: [String] {
        switch self {
        case .logout:
            return [
                "오리에 로그아웃 할 시",
                "사용할 때 다시 로그인을 해야해요."
            ]
        case .renewalPassword:
            return [
                "다음에 로그인할 때",
                "새 비밀번호로 로그인해야 해요."
            ]
        }
    }

    var cancelColor: AlertButtonColor {
        switch self {
        case .logout:
            return AlertButtonColor(
                foregroundColor: .GrayScale.gray600,
                backgroundColor: .GrayScale.gray200
            )

        case .renewalPassword:
            return AlertButtonColor(
                foregroundColor: .Primary.primary300,
                backgroundColor: .Primary.primary100
            )
        }
    }

    var okColor: AlertButtonColor {
        switch self {
        case .logout:
            return AlertButtonColor(
                foregroundColor: .white,
                backgroundColor: .State.red
            )

        case .renewalPassword:
            return AlertButtonColor(
                foregroundColor: .GrayScale.gray100,
                backgroundColor: .Primary.primary300
            )
        }
    }
}
