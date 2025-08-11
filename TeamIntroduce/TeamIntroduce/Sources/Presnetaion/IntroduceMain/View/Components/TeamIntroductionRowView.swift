//
//  TeamIntroductionRowView.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import SwiftUI

struct TeamIntroductionRowView: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 42, height: 42)
            VStack(alignment: .leading, spacing: 4) {
                Text("김철수")
                    .pretendardFont(family: .SemiBold, size: 14)
                    .foregroundStyle(.textPrimary)
                
                Text("iOS 개발자")
                    .pretendardFont(family: .Regular, size: 12)
                    .foregroundStyle(.textSecondary)
                
                MBTILabel(mbti: .enfj)
            }
            
            Spacer()
            
            Image("ArrowRight")
                .foregroundStyle(Color(hex: "717182"))
        }
        .padding(16)
        .background(Color.staticWhite)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 1)
    }
}

#Preview {
    TeamIntroductionRowView()
}
