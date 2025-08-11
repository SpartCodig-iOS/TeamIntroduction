//
//  MoreInfoItem.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import Foundation
import SwiftUI

enum MoreInfoItem: String , CaseIterable , Identifiable {
  case teamIntroduce
  case teamAgreement
  case teamBlog
  var id: String { rawValue }

  var titleContent: String {
    switch self {
    case .teamIntroduce:
      return "팀 소개"
    case .teamAgreement:
      return "팀 약속"
    case .teamBlog:
      return "팀 블로그"
    }
  }

  var subtitleContent: String {
    switch self {
    case .teamIntroduce:
      return"우리 팀의 특징과 목표"
    case .teamAgreement:
      return "함께 지켜나갈 소중한 약속들"
    case .teamBlog:
      return "팀원들의 블로그 모음"
    }
  }

  var images: ImageAsset {
    switch self {
    case .teamIntroduce:
      return .people
    case .teamAgreement:
      return .check
    case .teamBlog:
      return .blog
    }
  }

  var color: Color {
    switch self {
    case .teamIntroduce:
      return .blue10.opacity(0.1)
    case .teamAgreement:
      return .green.opacity(0.1)
    case .teamBlog:
      return .lightPurple.opacity(0.1)
    }
  }


  static var moreInfoList: [MoreInfoItem] {
    [.teamIntroduce, .teamAgreement, .teamBlog]
  }

}
