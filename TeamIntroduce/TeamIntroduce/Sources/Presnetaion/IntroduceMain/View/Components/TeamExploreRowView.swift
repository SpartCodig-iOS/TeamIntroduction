//
//  TeamExploreRowView.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import SwiftUI

enum TeamExploreItem: CaseIterable, Identifiable {
    case introduction
    case agreement
    case blog
    
    var id: Self { self }
}

struct TeamExploreRowView: View {
    
    private let item: TeamExploreItem
    
    private var title: String {
        switch item {
        case .introduction:
            return "팀 소개"
        case .agreement:
            return "팀 약속"
        case .blog:
            return "팀 블로그"
        }
    }
    
    private var subtitle: String {
        switch item {
        case .introduction:
            return "우리 팀의 특징과 목표"
        case .agreement:
            return "함께 지켜나갈 소중한 약속들"
        case .blog:
            return "팀원들의 블로그 모음"
        }
    }
    
    init(item: TeamExploreItem) {
        self.item = item
    }
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 42, height: 42)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .pretendardFont(family: .semiBold, size: 14)
                    .foregroundStyle(.textPrimary)
                
                Text(subtitle)
                    .pretendardFont(family: .regular, size: 12)
                    .foregroundStyle(.textSecondary)
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
    VStack {
        TeamExploreRowView(item: .introduction)
        TeamExploreRowView(item: .agreement)
        TeamExploreRowView(item: .blog)
    }
}
