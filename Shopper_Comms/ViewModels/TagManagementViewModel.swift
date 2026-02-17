//
//  TagManagementViewModel.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import Foundation
import SwiftUI
import Combine

final class TagManagementVM: ObservableObject {
    @Published var allTags: [String] = []

    private let store: LocalPromptStore

    init(store: LocalPromptStore) {
        self.store = store
        refresh()
    }

    func refresh() {
        allTags = store.allTags
    }

    func promptCount(for tag: String) -> Int {
        store.prompts.filter { $0.tags.contains(tag) }.count
    }
}

