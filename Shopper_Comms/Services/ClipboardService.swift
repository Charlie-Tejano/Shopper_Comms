//
//  ClipboardService.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import UIKit

struct ClipboardService {
    static func copy(_ text: String) {
        UIPasteboard.general.string = text
        Haptics.success()
    }

    static func pasteboardContents() -> String? {
        UIPasteboard.general.string
    }
}

