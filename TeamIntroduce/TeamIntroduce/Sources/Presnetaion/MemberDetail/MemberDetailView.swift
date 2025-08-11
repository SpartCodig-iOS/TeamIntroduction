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
    var collabStyle: String = "아이디어클자유롭게공유하고，다양한관점에서문제를바라보는것을 선호합니다.팀원들의의견을경청하고，함께더나은해결책을찾아가는협업을추구합니다."
    var blogURL: String? = "https: //chulsoo.dev"
}

struct MemberDetailView: View {
    var body: some View {
        VStack(spacing: 20) {
            MemberProfileView(profile: MemberProfile())

            IntroductionView(profile: MemberProfile())
        }
        .padding(.horizontal, 14)
    }
}

struct MemberProfileView: View {
    let profile: MemberProfile

    var body: some View {
        HStack {
            Spacer()

            VStack(spacing: 7) {
                Image(systemName: MemberProfile().image)
                    .font(.system(size: 40))

                Text(MemberProfile().name)
                    .pretendardFont(family: .Regular, size: 13)

                Text(MemberProfile().role)
                    .pretendardFont(family: .Regular, size: 13)


                Text(MemberProfile().mbti)
                    .pretendardFont(family: .Regular, size: 13)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Capsule().fill(.gray20))
            }
            .padding(.vertical, 10)

            Spacer()
        }
        .cardStyle()
    }
}

struct IntroductionView: View {
    let profile: MemberProfile

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("자기소개")
                .pretendardFont(family: .SemiBold, size: 14)
            VStack {
                Text(MemberProfile().introduction)
                    .pretendardFont(family: .Regular, size: 13)
                    .lineSpacing(3)
            }
            .cardStyle()
        }
    }
}

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.staticWhite)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.borderInactive, lineWidth: 0.5)
            )
            .shadow(color: .shadowDefault, radius: 3, x: 0, y: 1)
    }
}

extension View {
    public func cardStyle() -> some View {
        modifier(CardStyle())
    }
}

struct MemberDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemberDetailView()
    }
}
