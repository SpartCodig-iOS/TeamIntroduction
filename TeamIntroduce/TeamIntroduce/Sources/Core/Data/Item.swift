//
//  Item.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

@Model
final class IntroductionRowModels: Identifiable, Hashable {
  var id = UUID()
  var name: String
  var role: String
  var imageName: String
  var mbti: MBTI?
  var introduction: String?
  var isLeader: Bool

  init(
    name: String,
    role: String,
    imageName: String,
    mbti: MBTI?,
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
extension IntroductionRowModels {
  static let mockData: [IntroductionRowModels] = [
    .init(
      name: "김민희",
      role: "iOS Developer",
      imageName: "profile_kim",
      mbti: .estp,
      introduction: "서버 아키텍처에 관심이 많습니다",
      isLeader: true
    ),
    .init(
      name: "서원지",
      role: "iOS Developer",
      imageName: "profile_lee",
      mbti: .intp,
      introduction: "사용자 경험을 최우선으로 생각합니다"
    ),
    .init(
      name: "홍석현",
      role: "iOS Developer",
      imageName: "profile_hong",
      mbti: .enfj,
      introduction: "SwiftUI와 iOS 개발을 좋아합니다"
    )
  ]
}
