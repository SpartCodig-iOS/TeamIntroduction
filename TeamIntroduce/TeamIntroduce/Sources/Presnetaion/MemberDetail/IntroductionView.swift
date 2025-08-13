//
//  IntroductionView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/12/25.
//
import SwiftUI

struct IntroductionView: View {
    let profile: MemberProfile

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("자기소개")
                .pretendardFont(family: .SemiBold, size: 14)
            Text(profile.introduction)
                .pretendardFont(family: .Regular, size: 13)
                .foregroundStyle(.textSecondary100)
                .lineSpacing(5)
                .cardStyle()
        }
    }
}
