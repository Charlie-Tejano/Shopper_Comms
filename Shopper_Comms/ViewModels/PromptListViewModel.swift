//
//  PromptListViewModel.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import Foundation
import Combine

final class PromptListVM: ObservableObject {
    @Published var filter = FilterCriteria()
    @Published var showingEditor = false
    @Published var promptToEdit: Prompt? = nil

    private let store: LocalPromptStore
    private var cancellables = Set<AnyCancellable>()

    init(store: LocalPromptStore) {
        self.store = store
    }

    var filteredPrompts: [Prompt] {
        if filter.isActive {
            return store.prompts.filter { filter.matches($0) }
        }
        return store.prompts
    }

    func deletePrompt(at offsets: IndexSet) {
        let toDelete = offsets.map { filteredPrompts[$0] }
        for prompt in toDelete {
            store.delete(prompt)
        }
    }

    func presentNewPrompt() {
        promptToEdit = nil
        showingEditor = true
    }

    func presentEditPrompt(_ prompt: Prompt) {
        promptToEdit = prompt
        showingEditor = true
    }
}

