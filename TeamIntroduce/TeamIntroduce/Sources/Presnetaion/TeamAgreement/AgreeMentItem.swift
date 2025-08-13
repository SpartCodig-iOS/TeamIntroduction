//
//  AgreeMentItem.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/13/25.
//

import Foundation
import SwiftUI

struct AgreeMentItem: Identifiable {
  let id = UUID()
  let number: Int
  let color: Color
  let agreeMentTitle: String
  let agreeMentSubTitle: String
}

extension AgreeMentItem {
  static let items: [AgreeMentItem] = [
    .init(number: 1, color: .blue20, agreeMentTitle: "스크럼 시간", agreeMentSubTitle: "참여못하는 날은 노션에 미리 작성해두고, 당일 불참시 슬랙 DM 보내기"),
    .init(number: 2, color: .green10, agreeMentTitle: "시간과 약속 준수", agreeMentSubTitle: "정해진 시간과 약속을 지켜 서로에 대한 신뢰를 쌓겠습니다."),
    .init(number: 3, color: .lightPurple10, agreeMentTitle: "스크럼 참여시간 ", agreeMentSubTitle: "스크럼 하루 두번 (10:00, 20:00)"),
    .init(number: 4, color: .orange10, agreeMentTitle: "GIT 커벤션 및 PR", agreeMentSubTitle: "git-flow, PR 머지(머지 할때는 스쿼시 머지)"),
    .init(number: 5, color: .red10, agreeMentTitle: "점심시간", agreeMentSubTitle: "점심시간 12:30, 저녁시간 18:00 (1시간)")
    ]
}

