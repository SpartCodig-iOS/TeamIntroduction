//
//  EditButton.swift
//  TeamIntroduce
//
//  Created by 김민희 on 8/12/25.
//
import SwiftUI

struct EditButton: View {
    var body: some View {
        Button(action: {}) {
            Text("수정")
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 48)
        .background(.backGroundPrimary)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
