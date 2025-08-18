//
//  MemberProfileView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/12/25.
//
import SwiftUI

struct MemberProfileView: View {
  let profile: TeamMember

  var body: some View {
    HStack {
      Spacer()

      VStack(spacing: 7) {
        Image(profile.imageName)
          .resizable()
          .scaledToFit()
          .frame(width: 40, height: 40)
          .clipShape(Circle())
          .shadow(color: .shadowDefault, radius: 4)

        Text(profile.name)
          .pretendardFont(family: .regular, size: 13)

        Text(profile.role)
          .pretendardFont(family: .regular, size: 13)
          .foregroundStyle(.textSecondary100)


        Text(profile.mbti?.rawValue ?? "")
          .pretendardFont(family: .regular, size: 13)
          .padding(.horizontal, 12)
          .padding(.vertical, 6)
          .background(Capsule().fill(.gray20))
      }

      Spacer()
    }
    .cardStyle()
  }
}
