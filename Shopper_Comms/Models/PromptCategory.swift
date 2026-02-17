//
//  PromptCategory.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/17/26.
//

import Foundation

enum PromptCategory: String, Codable, Hashable, CaseIterable, Identifiable {
    case greeting
    case delivery
    case substitution
    case outOfStock
    case followUp
    case closing
    case delay
    case introduction

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .greeting: return "Greeting"
        case .delivery: return "Delivery"
        case .substitution: return "Substitution"
        case .outOfStock: return "Out of Stock"
        case .followUp: return "Follow Up"
        case .closing: return "Closing"
        case .delay: return "Delay"
        case .introduction: return "Introduction"
        }
    }
}

