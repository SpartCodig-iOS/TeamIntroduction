//
//  MemberDetailViewModel.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/13/25.
//

import SwiftUI
import SwiftData

@MainActor
class MemberDetailViewModel: ObservableObject {
  @Published var isEditing: Bool = false
  @Published var member: TeamMember?
  private let modelContet: ModelContext

  init(memberID: UUID, modelContet: ModelContext) {
    self.modelContet = modelContet
    fetchMember(memberID)
  }

  func startEditing() {
    isEditing = true
  }

  func cancelEditing() {
    modelContet.rollback()
    isEditing = false
  }

  func saveEditing() {
    try? modelContet.save()
    isEditing = false
  }

  func fetchMember(_ id: UUID) {
    let predicate = #Predicate<TeamMember> { $0.id == id }
    let descriptor = FetchDescriptor<TeamMember>(predicate: predicate)

    do {
      self.member = try modelContet.fetch(descriptor).first
    } catch {
      print("Failed to fetch member: \(error)")
    }
  }

}
