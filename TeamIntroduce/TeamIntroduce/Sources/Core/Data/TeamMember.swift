//
//  TeamMember.swift
//  TeamIntroduce
//
//  Created by 홍석현 on 8/12/25.
//

import Foundation
import SwiftData

@Model
final class TeamMember: Identifiable {
    var id: UUID
    var name: String
    var imageName: String
    var role: String
    var mbti: String
    var introduction: String
    var strengths: [String]
    var blogLink: String
    var collaborationStyle: [String]
    var isLeader: Bool

    init(
        id: UUID = UUID(),
        name: String,
        imageName: String,
        role: String,
        mbti: String,
        introduction: String,
        strengths: [String],
        blogLink: String,
        collaborationStyle: [String],
        isLeader: Bool = false
    ) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.role = role
        self.mbti = mbti
        self.introduction = introduction
        self.strengths = strengths
        self.blogLink = blogLink
        self.collaborationStyle = collaborationStyle
        self.isLeader = isLeader
    }
}
