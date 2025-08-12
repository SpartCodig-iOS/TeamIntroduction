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
  @State private var moreinfoitem: MoreInfoItem = .teamIntroduce

  var body: some View {
    ZStack {
      Color.white
        .edgesIgnoringSafeArea(.all)

      VStack {
        Spacer()

        Text("main")

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
          .pretendardFont(family:.semiBold, size: 20)
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
            moreInfoItem: item,
            selection: $moreinfoitem,
            arrowAction: { item in
              handleMoreInfoItem(for: item)
            }
          )
          .padding(.vertical, 3)
        }
      }
    }
    .padding(.horizontal, 24)
  }

  func handleMoreInfoItem(for moreInfo: MoreInfoItem) {
    switch moreInfo {
    case .teamIntroduce:
      coordinator.send(.present(.teamIntroduce))
    case .teamAgreement:
      coordinator.send(.present(.teamAgreement))
    case .teamBlog:
      coordinator.send(.present(.teamBlog))
    }
  }
}

#Preview {
  ContentView()
    .modelContainer(for: Item.self, inMemory: true)
}
