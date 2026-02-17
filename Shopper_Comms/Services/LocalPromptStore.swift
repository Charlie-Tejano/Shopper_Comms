//
//  LocalPromptStore.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import Foundation
import Combine
import SwiftUI

final class LocalPromptStore: ObservableObject {
    @Published private(set) var prompts: [Prompt] = []

    init() {
        loadPrompts()
    }

    func loadPrompts() {
        do {
            let loaded = try JSONFileManager.load()
            if loaded.isEmpty {
                prompts = PromptSeeder.defaultPrompts()
                savePrompts()
            } else {
                prompts = loaded
            }
        } catch {
            prompts = PromptSeeder.defaultPrompts()
            savePrompts()
        }
    }

    func savePrompts() {
        do {
            try JSONFileManager.save(prompts)
        } catch {
            print("Failed to save prompts: \(error)")
        }
    }

    func add(_ prompt: Prompt) {
        prompts.append(prompt)
        savePrompts()
    }

    func update(_ prompt: Prompt) {
        if let index = prompts.firstIndex(where: { $0.id == prompt.id }) {
            prompts[index] = prompt
            savePrompts()
        }
    }

    func delete(_ prompt: Prompt) {
        prompts.removeAll { $0.id == prompt.id }
        savePrompts()
    }

    func deleteAt(offsets: IndexSet) {
        prompts.remove(atOffsets: offsets)
        savePrompts()
    }

    var allTags: [String] {
        let tagSet = Set(prompts.flatMap { $0.tags })
        return tagSet.sorted()
    }
}

