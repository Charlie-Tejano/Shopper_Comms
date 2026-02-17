//
//  PromptEditorViewModel.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import Foundation
import Combine

final class PromptEditorVM: ObservableObject {
    @Published var title: String
    @Published var content: String
    @Published var tagsText: String
    @Published var selectedPlatforms: Set<Platform>
    @Published var platformTagsText: [Platform: String]

    private let store: LocalPromptStore
    private let existingPrompt: Prompt?

    var isEditing: Bool { existingPrompt != nil }

    var isValid: Bool {
        !title.trimmingCharacters(in: .whitespaces).isEmpty &&
        !content.trimmingCharacters(in: .whitespaces).isEmpty
    }

    init(store: LocalPromptStore, prompt: Prompt? = nil) {
        self.store = store
        self.existingPrompt = prompt

        self.title = prompt?.title ?? ""
        self.content = prompt?.content ?? ""
        self.tagsText = prompt?.tags.joined(separator: ", ") ?? ""
        if let keys = prompt?.platformTags.keys {
            self.selectedPlatforms = Set(keys)
        } else {
            self.selectedPlatforms = []
        }

        var ptText: [Platform: String] = [:]
        for platform in Platform.allCases {
            ptText[platform] = prompt?.platformTags[platform]?.joined(separator: ", ") ?? ""
        }
        self.platformTagsText = ptText
    }

    func save() {
        let tags = tagsText
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }

        var platformTags: [Platform: [String]] = [:]
        for platform in selectedPlatforms {
            let pTags = (platformTagsText[platform] ?? "")
                .split(separator: ",")
                .map { $0.trimmingCharacters(in: .whitespaces) }
                .filter { !$0.isEmpty }
            platformTags[platform] = pTags
        }

        if var existing = existingPrompt {
            existing.title = title.trimmingCharacters(in: .whitespaces)
            existing.content = content.trimmingCharacters(in: .whitespaces)
            existing.tags = tags
            existing.platformTags = platformTags
            store.update(existing)
        } else {
            let newPrompt = Prompt(
                title: title.trimmingCharacters(in: .whitespaces),
                content: content.trimmingCharacters(in: .whitespaces),
                tags: tags,
                platformTags: platformTags
            )
            store.add(newPrompt)
        }
    }
}

