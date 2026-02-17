//
//  FilterCriteria.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/17/26.
//

import Foundation

struct FilterCriteria {
    var searchText: String = ""
    var selectedPlatform: Platform? = nil
    var selectedCategory: PromptCategory? = nil
    var selectedTags: Set<String> = []

    var isActive: Bool {
        !searchText.isEmpty || selectedPlatform != nil || selectedCategory != nil || !selectedTags.isEmpty
    }

    func matches(_ prompt: Prompt) -> Bool {
        if !searchText.isEmpty {
            let query = searchText.lowercased()
            let matchesTitle = prompt.title.lowercased().contains(query)
            let matchesContent = prompt.content.lowercased().contains(query)
            let matchesTags = prompt.tags.contains { $0.lowercased().contains(query) }
            if !matchesTitle && !matchesContent && !matchesTags {
                return false
            }
        }

        if let platform = selectedPlatform {
            if !prompt.platformTags.keys.contains(platform) {
                return false
            }
        }

        if let category = selectedCategory {
            if !prompt.tags.contains(category.rawValue) {
                return false
            }
        }

        if !selectedTags.isEmpty {
            let promptTagSet = Set(prompt.tags)
            if selectedTags.isDisjoint(with: promptTagSet) {
                return false
            }
        }

        return true
    }
}

