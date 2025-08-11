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
        Text("main")
          .onTapGesture {
            coordinator.send(.presntDetail)
          }

        Spacer()

        moreInfoSection()

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
  @ViewBuilder
  private func moreInfoSection() -> some View {
    VStack {
      HStack {
        Text("더 알아보기")
          .pretendardFont(family:.SemiBold, size: 20)
          .foregroundStyle(.basicBlack)

        Spacer()

      }

      Spacer()
        .frame(height: 14)


      ForEach(MoreInfoItem.moreInfoList, id: \.self) { item in
        VStack {
          ListRowComponet(
            color: item.color,
            image: item.images,
            title: item.titleContent,
            subContent: item.subtitleContent,
            blogUrl: "",
            showArrow: true,
            arrowAction: {

            }
          )
          .padding(.vertical, 3)
        }
      }

    }
    .padding(.horizontal, 24)
  }
}

#Preview {
  ContentView()
    .modelContainer(for: Item.self, inMemory: true)
}
