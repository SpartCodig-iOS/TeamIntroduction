//
//  IntroductionEditView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/14/25.
//
import SwiftUI

struct IntroductionEditView: View {
  @Bindable var member: TeamMember

  var body: some View {
    VStack(alignment: .leading, spacing: 14) {
      Text("자기소개")
        .pretendardFont(family: .semiBold, size: 14)

      TextField("", text: $member.introduction, axis: .vertical)
        .pretendardFont(family: .regular, size: 13)
        .foregroundStyle(.textSecondary100)
        .lineSpacing(5)
        .lineLimit(1...10)
        .cardStyle()
    }
  }
}
