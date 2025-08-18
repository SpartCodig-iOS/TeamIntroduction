//
//  IntroductionRowView.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import SwiftUI

struct IntroductionRowView: View {
  private let model: TeamMember

  init(model: TeamMember) {
    self.model = model
  }

  var body: some View {
    HStack {
      Circle()
        .fill(.staticWhite)
        .frame(width: 42, height: 42)
        .shadow(color: .shadowDefault, radius: 4)
        .overlay {
          Image(model.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
        }


      VStack(alignment: .leading, spacing: 4) {
        HStack(spacing: 4) {
          Text(model.name)
            .pretendardFont(family: .semiBold, size: 14)
            .foregroundStyle(.textPrimary)

          if model.isLeader {
            Image(systemName: "crown.fill")
              .foregroundStyle(Color.yellow)
              .font(.system(size: 12))
          }
        }

        Text(model.role)
          .pretendardFont(family: .regular, size: 12)
          .foregroundStyle(.textSecondary)

        MBTILabel(mbti: model.mbti ?? .enfp)
      }

      Spacer()

      Image(asset: .arrowRight)
        .foregroundStyle(Color(hex: "717182"))
    }
    .padding(16)
    .background(.staticWhite)
    .clipShape(RoundedRectangle(cornerRadius: 12))
    .shadow(radius: 1)
  }
}
