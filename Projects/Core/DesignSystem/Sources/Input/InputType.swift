import Foundation

public enum InputBoxType: Equatable {
    case button(InputButtonType)
    case icon(ORIIcon.Image)
    case secure
}

public enum DescriptionType: String {
    case successToSendEmail = "인증 메일이 발송되었어요."
    case isAlreadyAccounted = "이미 가입되있는 이메일이에요."
    case isEmpty = "내용을 입력해주세요."
    case wrongPassword = "잘못된 비밀번호에요."
    case wrongAuthCode = "옳지 않은 인증번호에요."
    case isNotAccounted = "가입되있지 않은 이메일이에요."
    case isNotEmail = "올바르지 않은 메일주소에요."

    func descriptionIcon() -> ORIIcon {
        switch self {
        case .successToSendEmail: return ORIIcon(.check)
        default: return ORIIcon(.error)
        }
    }
}
