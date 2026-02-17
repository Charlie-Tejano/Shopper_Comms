//
//  PromptDetailViewModel.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/17/26.
//

import Foundation
import Combine

final class PromptDetailVM: ObservableObject {
    @Published var prompt: Prompt
    @Published var copied = false

    private let store: LocalPromptStore

    init(prompt: Prompt, store: LocalPromptStore) {
        self.prompt = prompt
        self.store = store
    }

    func copyToClipboard() {
        ClipboardService.copy(prompt.content)
        copied = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.copied = false
        }
    }

    func sharePrompt() {
        ShareService.share(prompt.content)
    }

    func deletePrompt() {
        store.delete(prompt)
    }

    func platformTags(for platform: Platform) -> [String] {
        prompt.platformTags[platform] ?? []
    }
}

