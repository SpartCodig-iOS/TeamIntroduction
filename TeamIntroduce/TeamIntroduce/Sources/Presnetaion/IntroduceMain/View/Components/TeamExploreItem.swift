//
//  TeamExploreItem.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/12/25.
//

import Foundation

enum TeamExploreItem: CaseIterable, Identifiable {
  case introduction
  case agreement
  case blog

  var id: Self { self }


  var title: String {
    switch self {
    case .introduction:
      return "팀 소개"
    case .agreement:
      return "팀 약속"
    case .blog:
      return "팀 블로그"
    }
  }

  var subtitle: String {
    switch self {
    case .introduction:
      return "우리 팀의 특징과 목표"
    case .agreement:
      return "함께 지켜나갈 소중한 약속들"
    case .blog:
      return "팀원들의 블로그 모음"
    }
  }

  var imageName: ImageAsset {
    switch self {
    case .introduction:
      return .teamIntroductionLogo
    case .agreement:
      return .teamAgreementLogo
    case .blog:
      return .teamBlogLogo
    }
  }
}
