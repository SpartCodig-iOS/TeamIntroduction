//
//  StrengthsEditView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/14/25.
//
import SwiftUI

struct StrengthsEditView: View {
  @Binding var strengths: [String]

  var body: some View {
    VStack(alignment: .leading, spacing: 14) {
      Text("주요장점")
        .pretendardFont(family: .semiBold, size: 14)

      VStack {
        ForEach(strengths.indices, id: \.self) { index in
          HStack {
            Button {
              strengths.remove(at: index)
            } label: {
              Image(systemName: "minus.circle.fill")
                .foregroundStyle(.red)
            }

            TextField("", text: $strengths[index])
              .pretendardFont(family: .regular, size: 13)
              .foregroundStyle(.textSecondary100)
              .lineLimit(1...5)
          }
        }

        Button {
          strengths.append("")
        } label: {
          HStack {
            Image(systemName: "plus.circle.fill")
            Text("장점 추가하기")
              .pretendardFont(family: .regular, size: 13)
          }
        }
        .padding(.top, 10)
      }
      .cardStyle()
    }
  }
}
