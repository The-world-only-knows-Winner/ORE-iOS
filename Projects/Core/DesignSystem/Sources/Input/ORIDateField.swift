import SwiftUI
import UtilityModule
import UIKit

public struct ORIDateField: View {
    @Binding var date: Date
    @Binding var isShowDatePicker: Bool
    @FocusState var isFocused: Bool
    let title: String

    public init(
        date: Binding<Date>,
        isShowDatePicker: Binding<Bool>,
        title: String
    ) {
        _date = date
        _isShowDatePicker = isShowDatePicker
        self.title = title
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .oriFont(.body(.body4), color: .GrayScale.gray500)

            HStack {
                Button {
                    withAnimation {
                        hideKeyboard()
                        self.isShowDatePicker.toggle()
                    }
                } label: {
                    Text(date.toHyphenStrng())
                        .oriFont(.body(.body1), color: .GrayScale.gray700)
                }

                Spacer()
            }
            .padding(.bottom, 12)
            .overlay(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 5)
                    .stroke()
                    .fill(Color.GrayScale.gray400)
                    .frame(maxWidth: .infinity, maxHeight: 0.5)
            }

            if isShowDatePicker {
                DatePicker("", selection: $date, displayedComponents: .date)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
    }
}
