//
//  ContentView.swift
//  TeamIntroduce
//
//  Created by Wonji Suh  on 8/11/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var teamMembers: [TeamMember]
  @EnvironmentObject private var coordinator: IntroduceCoordinator

  var body: some View {
    List(teamMembers, id: \.id) { member in
      Text(member.name)
    }
  }
}

#Preview {
  ContentView()
    .modelContainer(for: TeamMember.self, inMemory: true)
}
