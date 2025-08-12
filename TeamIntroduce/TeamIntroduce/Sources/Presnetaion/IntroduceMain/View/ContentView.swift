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
  @Query private var items: [TeamMember]
  @EnvironmentObject private var coordinator: IntroduceCoordinator


  var body: some View {
    VStack {
      Text("main")
        .onTapGesture {
          coordinator.send(.present(.teamAgreement))
        }
    }
  }
}

#Preview {
  ContentView()
    .modelContainer(for: TeamMember.self, inMemory: true)
}
