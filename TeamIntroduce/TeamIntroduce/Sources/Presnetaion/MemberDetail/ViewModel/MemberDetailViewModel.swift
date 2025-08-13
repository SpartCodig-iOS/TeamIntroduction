//
//  MemberDetailViewModel.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/13/25.
//

import SwiftUI

class MemberDetailViewModel: ObservableObject {
  @Published var isEditing: Bool = false
  @Published var profile: MemberProfile
  @Published var editingProfile: MemberProfile

  init() {
    self.profile = MemberProfile()
    self.editingProfile = MemberProfile()
  }

  func startEditing() {
    isEditing = true
  }

  func cancelEditing() {
    isEditing = false
  }

  func saveEditing() {
    profile = editingProfile
    isEditing = false
  }

}
