//
//  JSONFileManager.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import Foundation

struct JSONFileManager {
    private static let fileName = "shopper_comms_prompts.json"

    private static var fileURL: URL {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documents.appendingPathComponent(fileName)
    }

    static func save(_ prompts: [Prompt]) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(prompts)
        try data.write(to: fileURL, options: .atomic)
    }

    static func load() throws -> [Prompt] {
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            return []
        }
        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        return try decoder.decode([Prompt].self, from: data)
    }

    static func deleteAll() throws {
        if FileManager.default.fileExists(atPath: fileURL.path) {
            try FileManager.default.removeItem(at: fileURL)
        }
    }
}

