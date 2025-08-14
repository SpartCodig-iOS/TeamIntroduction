//
//  BlogEditView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/14/25.
//
import SwiftUI

struct BlogEditView: View {
  @Bindable var member: TeamMember

  var body: some View {
    VStack(alignment: .leading, spacing: 14) {
      Text("블로그")
        .pretendardFont(family: .semiBold, size: 14)

      TextField("블로그 URL", text: $member.blogLink)
        .pretendardFont(family: .regular, size: 13)
        .cardStyle()
    }
  }
}
