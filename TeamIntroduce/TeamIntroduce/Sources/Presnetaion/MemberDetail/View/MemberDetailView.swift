//
//  MemberDetailView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/11/25.
//

import SwiftUI

struct MemberProfile {
  var image: String = "person.crop.circle"
  var name: String = "김철수"
  var role: String = "프론트엔드개발자"
  var mbti: String = "ENFP"
  var introduction: String = "사용자경험을최우선으로생각하는프론트엔드개발자입니다.새로운기술을배우는것을좋아하고，팀원들과아이디어를 공유하며함께성장하는것을즐깁니다."
  var strengths: [String] = ["창의적인문제해결능력", "새로운기술에대한빠른학습력", "사용자중심적사고", "긍정적이고적극적인커뮤니케이션"]
  var collabStyle: String = "아이디어를 자유롭게공유하고，다양한관점에서문제를바라보는것을 선호합니다.팀원들의의견을경청하고，함께더나은해결책을찾아가는협업을추구합니다."
  var blogURL: String = "https: //chulsoo.dev"
}

struct MemberDetailView: View {
  private let profile = MemberProfile()
  @ObservedObject var coordinator: IntroduceCoordinator

  var body: some View {
    ZStack {
      ScrollView {
        Spacer()
          .frame(height: 14)

        CustomNavigationBackBar {
          coordinator.goBack()
        }

        Spacer().frame(height: 20)

        VStack(spacing: 20) {
          MemberProfileView(profile: profile)

          IntroductionView(profile: profile)

          StrengthsView(profile: profile)

          CollabStyleView(profile: profile)

          BlogView(profile: profile)
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 80)
      }
      .scrollIndicators(.hidden)

      VStack {
        Spacer()

        EditButton()
          .padding(.horizontal, 16)
      }
    }
  }
}

#Preview {
  @Previewable @StateObject var coordinator: IntroduceCoordinator = IntroduceCoordinator()

  MemberDetailView(coordinator: coordinator)
}
