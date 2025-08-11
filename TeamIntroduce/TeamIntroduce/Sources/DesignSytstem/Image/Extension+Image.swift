//
//  Extension+Image.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import SwiftUI

 extension UIImage {
  convenience init?(_ asset: ImageAsset) {
    self.init(named: asset.rawValue, in: Bundle.main, with: nil)
  }

  convenience init?(assetName: String) {
    self.init(named: assetName, in: Bundle.main, with: nil)
  }
}

extension Image {
  init(asset: ImageAsset) {
    if let uiImage = UIImage(asset) {
      self.init(uiImage: uiImage)
    } else {
      self = Image(systemName: "questionmark")
    }
  }

  init(assetName: String) {
    if let uiImage = UIImage(assetName: assetName) {
      self.init(uiImage: uiImage)
    } else {
      self = Image(systemName: "questionmark")
    }
  }
}
