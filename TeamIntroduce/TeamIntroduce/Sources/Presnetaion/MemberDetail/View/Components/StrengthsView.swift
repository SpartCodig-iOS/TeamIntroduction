//
//  StrengthsView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/12/25.
//
import SwiftUI

struct StrengthsView: View {
  var isEditing: Bool
  @Binding var strengths: [String]

  var body: some View {
    VStack(alignment: .leading, spacing: 14) {
      Text("주요장점")
        .pretendardFont(family: .semiBold, size: 14)

      if isEditing {
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

      } else {
        VStack {
          ForEach(strengths, id: \.self) { item in
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
}
