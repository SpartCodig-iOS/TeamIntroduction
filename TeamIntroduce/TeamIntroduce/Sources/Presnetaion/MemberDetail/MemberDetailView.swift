//
//  MemberDetailView.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/11/25.
//

import SwiftUI

struct MemberProfile {
    var image: String
    var name: String
    var role: String
    var mbti: String
    var introduction: String
    var strengths: [String]
    var collabStyle: String
    var blogURL: String?
}

struct MemberDetailView: View {
    let profile: MemberProfile

    var body: some View {
        VStack {

        }

    }
}

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.staticWhite)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.borderInactive, lineWidth: 0.5)
            )
            .shadow(color: .shadowDefault, radius: 3, x: 0, y: 1)
    }
}

extension View {
    public func cardStyle() -> some View {
        modifier(CardStyle())
    }
}

struct MemberDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemberDetailView(profile: .init(image: "", name: "", role: "", mbti: "", introduction: "", strengths: [], collabStyle: ""))
    }
}
