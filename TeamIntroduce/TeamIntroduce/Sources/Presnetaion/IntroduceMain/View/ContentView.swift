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
  @Query private var items: [Item]
  @EnvironmentObject private var coordinator: IntroduceCoordinator

  var body: some View {
    ZStack {
      Color.white
        .edgesIgnoringSafeArea(.all)

      VStack {
        Spacer()

        Text("main")

        Spacer()


        Spacer()
          .frame(height: 20)
      }
    }
  }

  private func addItem() {
    withAnimation {
      let newItem = Item(timestamp: Date())
      modelContext.insert(newItem)
    }
  }

  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      for index in offsets {
        modelContext.delete(items[index])
      }
    }
  }
}


extension ContentView {


}

#Preview {
  ContentView()
    .modelContainer(for: Item.self, inMemory: true)
}
