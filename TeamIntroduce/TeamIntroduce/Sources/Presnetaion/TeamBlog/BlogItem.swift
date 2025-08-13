//
//  BlogItem.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/12/25.
//

import Foundation

struct BlogItem: Identifiable {
  let id = UUID()
  let name: String
  let blogTitle: String
  let blogLink: String
}
