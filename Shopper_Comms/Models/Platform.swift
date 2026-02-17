//
//  Platform.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/17/26.
//

import Foundation

enum Platform: String, Codable, Hashable, CaseIterable, Identifiable {
    case instacart
    case amazon_fresh
    case shipt

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .instacart: return "Instacart"
        case .amazon_fresh: return "Amazon Fresh"
        case .shipt: return "Shipt"
        }
    }

    var iconName: String {
        switch self {
        case .instacart: return "cart.fill"
        case .amazon_fresh: return "shippingbox.fill"
        case .shipt: return "bag.fill"
        }
    }
}

