//
//  CopyButton.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import SwiftUI

struct CopyButton: View {
    let text: String
    @State private var copied = false

    var body: some View {
        Button {
            ClipboardService.copy(text)
            copied = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                copied = false
            }
        } label: {
            HStack(spacing: 6) {
                Image(systemName: copied ? "checkmark" : "doc.on.doc")
                Text(copied ? "Copied" : "Copy")
            }
            .font(.subheadline.weight(.medium))
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(copied ? Color.green : Color.accentColor)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .animation(.easeInOut(duration: 0.2), value: copied)
    }
}

#Preview {
    CopyButton(text: "Sample text to copy")
}

