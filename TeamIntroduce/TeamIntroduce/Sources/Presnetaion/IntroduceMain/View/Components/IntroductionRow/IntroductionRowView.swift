//
//  IntroductionRowView.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import SwiftUI

struct IntroductionRowView: View {
    private let model: IntroductionRowModel
    
    init(model: IntroductionRowModel) {
        self.model = model
    }
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 42, height: 42)
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text(model.name)
                        .pretendardFont(family: .SemiBold, size: 14)
                        .foregroundStyle(.textPrimary)
                    
                    if model.isLeader {
                        Image(systemName: "crown.fill")
                            .foregroundStyle(Color.yellow)
                            .font(.system(size: 12))
                    }
                }
                
                Text(model.role)
                    .pretendardFont(family: .Regular, size: 12)
                    .foregroundStyle(.textSecondary)
                
                MBTILabel(mbti: model.mbti)
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
    IntroductionRowView(model: IntroductionRowModel.mockData[0])
}
