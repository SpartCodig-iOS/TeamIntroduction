//
//  IntroductionView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/12/25.
//
import SwiftUI

struct IntroductionView: View {
  var isEditing: Bool
  @Binding var introduction: String

  var body: some View {
    VStack(alignment: .leading, spacing: 14) {
      Text("자기소개")
        .pretendardFont(family: .semiBold, size: 14)

      if isEditing {
        TextField("", text: $introduction, axis: .vertical)
          .pretendardFont(family: .regular, size: 13)
          .foregroundStyle(.textSecondary100)
          .lineSpacing(5)
          .lineLimit(1...10)
          .cardStyle()
      } else {
        Text(introduction)
          .pretendardFont(family: .regular, size: 13)
          .foregroundStyle(.textSecondary100)
          .lineSpacing(5)
          .cardStyle()
      }
    }
  }
}
