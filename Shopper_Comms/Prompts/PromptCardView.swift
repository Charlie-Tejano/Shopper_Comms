//
//  PromptCardView.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import SwiftUI

struct PromptCard: View {
    let prompt: Prompt

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(prompt.title)
                    .font(.headline)
                    .lineLimit(1)

                Spacer()

                PlatformBadgeRow(platforms: Array(prompt.platformTags.keys).sorted { $0.rawValue < $1.rawValue })
            }

            Text(prompt.content)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(2)

            if !prompt.tags.isEmpty {
                HStack(spacing: 6) {
                    ForEach(prompt.tags.prefix(3), id: \.self) { tag in
                        Text(tag)
                            .font(.caption2)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 3)
                            .background(Color.secondary.opacity(0.12))
                            .clipShape(Capsule())
                    }
                    if prompt.tags.count > 3 {
                        Text("+\(prompt.tags.count - 3)")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    List {
        PromptCard(prompt: Prompt(
            title: "Welcome",
            content: "Hi there! I'm your shopper and I'm starting on your order now.",
            tags: ["greeting", "introduction"],
            platformTags: [.instacart: ["greeting"], .shipt: ["greeting"]]
        ))
    }
}

