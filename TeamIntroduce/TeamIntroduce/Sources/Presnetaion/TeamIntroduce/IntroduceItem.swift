//
//  IntroduceItem.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/12/25.
//

import Foundation

struct IntroduceItem: Identifiable {
  let id = UUID()
  let image: ImageAsset
  let title: String
  let subtitle: String
}
