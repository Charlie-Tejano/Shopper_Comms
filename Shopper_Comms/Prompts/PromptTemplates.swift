//
//  PromptTemplates.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import Foundation

struct Prompt: Identifiable, Codable, Hashable { //...
    let id: UUID
    var title: String
    var content: String
    var tags: [String]
    // Tags specific to each platform, keyed by Platform
    var platformTags: [Platform: [String]]

    init(
        id: UUID = UUID(),
        title: String,
        content: String,
        tags: [String] = [],
        platformTags: [Platform: [String]] = [:]
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.tags = tags
        self.platformTags = platformTags
    }
}

