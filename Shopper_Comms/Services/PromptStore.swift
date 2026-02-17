//
//  PromptStore.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import Foundation

// Protocol for prompt storage abstraction
protocol PromptStore {
    var prompts: [Prompt] { get }
    func add(_ prompt: Prompt)
    func update(_ prompt: Prompt)
    func delete(_ prompt: Prompt)
    func loadPrompts()
}