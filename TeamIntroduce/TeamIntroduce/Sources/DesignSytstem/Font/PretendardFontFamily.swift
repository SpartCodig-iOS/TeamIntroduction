//
//  PretendardFontFamily.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import Foundation

enum PretendardFontFamily: CustomStringConvertible {
  case black
  case bold
  case extraBold
  case extraLight
  case light
  case medium
  case regular
  case semiBold
  case thin

  public var description: String {
    switch self {
    case .black:
      return "Black"
    case .bold:
      return "Bold"
    case .extraBold:
      return "ExtraBold"
    case .extraLight:
      return "ExtraLight"
    case .light:
      return "Light"
    case .medium:
      return "Medium"
    case .regular:
      return "Regular"
    case .semiBold:
      return "SemiBold"
    case .thin:
      return "Thin"
    }
  }
}
