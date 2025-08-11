//
//  IntroductionRowModel.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/11/25.
//

import Foundation

struct IntroductionRowModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let role: String // subTitle 대신 role로 더 명확하게
    let imageName: String
    let mbti: MBTI
    let introduction: String? // 간단한 소개글 추가
    let isLeader: Bool

    init(
        name: String,
        role: String,
        imageName: String,
        mbti: MBTI,
        introduction: String? = nil,
        isLeader: Bool = false
    ) {
        self.name = name
        self.role = role
        self.imageName = imageName
        self.mbti = mbti
        self.introduction = introduction
        self.isLeader = isLeader
    }
}

// MARK: - Mock Data
extension IntroductionRowModel {
    static let mockData: [IntroductionRowModel] = [
        IntroductionRowModel(
            name: "김민희",
            role: "iOS Developer",
            imageName: "profile_kim",
            mbti: .estp,
            introduction: "서버 아키텍처에 관심이 많습니다",
            isLeader: true
        ),
        IntroductionRowModel(
            name: "서원지",
            role: "iOS Developer",
            imageName: "profile_lee",
            mbti: .intp,
            introduction: "사용자 경험을 최우선으로 생각합니다"
        ),
        IntroductionRowModel(
            name: "홍석현",
            role: "iOS Developer",
            imageName: "profile_hong",
            mbti: .enfj,
            introduction: "SwiftUI와 iOS 개발을 좋아합니다"
        )
    ]
}
