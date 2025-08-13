//
//  StrengthsView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/12/25.
//
import SwiftUI

struct StrengthsView: View {
  let profile: MemberProfile
  
  var body: some View {
    VStack(alignment: .leading, spacing: 14) {
      Text("주요장점")
        .pretendardFont(family: .semiBold, size: 14)
      VStack {
        ForEach(profile.strengths, id: \.self) { item in
          HStack(alignment: .firstTextBaseline, spacing: 8) {
            Circle().frame(width: 5, height: 5)
            Text(item)
              .pretendardFont(family: .regular, size: 13)
              .foregroundStyle(.textSecondary100)
              .fixedSize(horizontal: false, vertical: true)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
        }
      }
      .cardStyle()
    }
  }
}
