import Foundation

public enum InputBoxType: Equatable {
    case button(InputButtonType)
    case icon(ORIIcon.Image)
    case secure
}

public enum DescriptionType: String {
    case success = "인증 메일이 발송되었어요."
    case fail = "이미 가입되있는 이메일이에요."
    case isEmpty = "내용을 입력해주세요."
}
