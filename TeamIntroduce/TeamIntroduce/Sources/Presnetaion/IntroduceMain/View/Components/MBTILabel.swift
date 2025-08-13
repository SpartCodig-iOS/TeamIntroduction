//
//  MBTILabel.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import SwiftUI

public enum MBTI: String, CaseIterable, Codable {
    case enfp = "ENFP"
    case estp = "ESTP"
    case infj = "INFJ"
    case intj = "INTJ"
    case isfj = "ISFJ"
    case enfj = "ENFJ"
    case infp = "INFP"
    case intp = "INTP"
    case isfp = "ISFP"
}

struct MBTILabel: View {
    
    private let mbti: MBTI
    
    private var backgroundColor: Color {
        switch mbti {
        case .enfp: return Color(hex: "FF6B6B")
        case .estp: return Color(hex: "E17055")
        case .infj: return Color(hex: "4ECDC4")
        case .intj: return Color(hex: "6C5CE7")
        case .isfj: return Color(hex: "A8E6CF")
        case .enfj: return Color(hex: "FFD93D")
        case .infp: return Color(hex: "DDA0DD")
        case .intp: return Color(hex: "74B9FF")
        case .isfp: return Color(hex: "FDCB6E")
        }
    }
    
    private var textColor: Color {
        switch mbti {
        case .enfp, .estp, .infj, .intj, .intp:
            return .white
        case .isfj, .enfj, .infp, .isfp:
            return Color(hex: "2D3436")
        }
    }
    
    init(mbti: MBTI) {
        self.mbti = mbti
    }
    
    var body: some View {
        Text(mbti.rawValue)
            .pretendardFont(family: .regular, size: 10)
            .foregroundStyle(textColor)
            .padding(.horizontal, 7)
            .padding(.vertical, 5)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    VStack {
        MBTILabel(mbti: .enfj)
        MBTILabel(mbti: .estp)
        MBTILabel(mbti: .intp)
    }
}
