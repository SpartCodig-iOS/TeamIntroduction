//
//  PretendardFontFamily.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import Foundation

enum PretendardFontFamily: CustomStringConvertible {
  case Black
  case Bold
  case ExtraBold
  case ExtraLight
  case Light
  case Medium
  case Regular
  case SemiBold
  case Thin

  public var description: String {
    switch self {
    case .Black:
      return "Black"
    case .Bold:
      return "Bold"
    case .ExtraBold:
      return "ExtraBold"
    case .ExtraLight:
      return "ExtraLight"
    case .Light:
      return "Light"
    case .Medium:
      return "Medium"
    case .Regular:
      return "Regular"
    case .SemiBold:
      return "SemiBold"
    case .Thin:
      return "Thin"
    }
  }
}
