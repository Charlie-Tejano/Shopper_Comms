//
//  PlatformIconView.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import SwiftUI

struct PlatformIconView: View {
    let platform: Platform
    var size: CGFloat = 24

    private var color: Color {
        switch platform {
        case .instacart: return .green
        case .amazon_fresh: return .orange
        case .shipt: return .blue
        }
    }

    var body: some View {
        Image(systemName: platform.iconName)
            .font(.system(size: size * 0.6))
            .frame(width: size, height: size)
            .foregroundStyle(color)
            .background(color.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: size * 0.25))
    }
}

struct PlatformBadgeRow: View {
    let platforms: [Platform]

    var body: some View {
        HStack(spacing: 6) {
            ForEach(platforms) { platform in
                PlatformIconView(platform: platform, size: 22)
            }
        }
    }
}

#Preview {
    VStack(spacing: 12) {
        PlatformIconView(platform: .instacart)
        PlatformIconView(platform: .amazon_fresh)
        PlatformIconView(platform: .shipt)
        PlatformBadgeRow(platforms: Platform.allCases)
    }
}

