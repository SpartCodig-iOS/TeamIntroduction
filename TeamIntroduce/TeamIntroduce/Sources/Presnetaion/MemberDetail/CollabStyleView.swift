//
//  CollabStyleView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/12/25.
//
import SwiftUI

struct CollabStyleView: View {
  let profile: MemberProfile
  
  var body: some View {
    VStack(alignment: .leading, spacing: 14) {
      Text("협업스타일")
        .pretendardFont(family: .semiBold, size: 14)
      Text(profile.collabStyle)
        .pretendardFont(family: .regular, size: 13)
        .foregroundStyle(.textSecondary100)
        .lineSpacing(5)
        .cardStyle()
    }
  }
}
