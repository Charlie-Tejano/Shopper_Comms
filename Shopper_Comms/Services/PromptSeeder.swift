//
//  PromptSeeder.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import Foundation

struct PromptSeeder {
    static func defaultPrompts() -> [Prompt] {
        [
            // Greetings
            Prompt(
                title: "Initial Greeting",
                content: "Hi there! I'm your shopper and I'm starting on your order now. I'll reach out if I have any questions about substitutions or availability.",
                tags: ["greeting", "introduction"],
                platformTags: [
                    .instacart: ["greeting"],
                    .shipt: ["greeting"],
                    .amazon_fresh: ["greeting"]
                ]
            ),
            Prompt(
                title: "Short Greeting",
                content: "Hello! I'm shopping your order now. Please let me know if you have any preferences on replacements.",
                tags: ["greeting"],
                platformTags: [
                    .instacart: ["greeting"],
                    .shipt: ["greeting"],
                    .amazon_fresh: ["greeting"]
                ]
            ),

            // Substitutions
            Prompt(
                title: "Substitution Request",
                content: "Just a heads up -- the item you requested is not available today. Would you like me to substitute it with a similar option, or would you prefer a refund for that item?",
                tags: ["substitution"],
                platformTags: [
                    .instacart: ["substitution"],
                    .shipt: ["substitution"],
                    .amazon_fresh: ["substitution"]
                ]
            ),
            Prompt(
                title: "Substitution Found",
                content: "The exact item was out of stock, but I found a very similar alternative. I'll go ahead and grab that unless you'd prefer something else or a refund.",
                tags: ["substitution"],
                platformTags: [
                    .instacart: ["substitution"],
                    .shipt: ["substitution"]
                ]
            ),
            Prompt(
                title: "Multiple Items Unavailable",
                content: "A few items on your list are currently unavailable. I've noted some possible replacements. Please let me know your preference for each, or I can refund any you don't want substituted.",
                tags: ["substitution", "outOfStock"],
                platformTags: [
                    .instacart: ["substitution"],
                    .shipt: ["substitution"],
                    .amazon_fresh: ["substitution"]
                ]
            ),

            // Out of Stock
            Prompt(
                title: "Item Out of Stock",
                content: "Unfortunately, the store is completely out of that item today and there are no similar alternatives available. I'll process a refund for it.",
                tags: ["outOfStock"],
                platformTags: [
                    .instacart: ["outOfStock"],
                    .shipt: ["outOfStock"],
                    .amazon_fresh: ["outOfStock"]
                ]
            ),

            // Delivery
            Prompt(
                title: "On My Way",
                content: "I've finished shopping and checked out. I'm on my way to you now!",
                tags: ["delivery"],
                platformTags: [
                    .instacart: ["delivery"],
                    .shipt: ["delivery"],
                    .amazon_fresh: ["delivery"]
                ]
            ),
            Prompt(
                title: "Delivery Arrival",
                content: "I've arrived and your groceries have been delivered. Thank you for your order!",
                tags: ["delivery", "closing"],
                platformTags: [
                    .instacart: ["delivery"],
                    .shipt: ["delivery"],
                    .amazon_fresh: ["delivery"]
                ]
            ),
            Prompt(
                title: "Delivery Delay",
                content: "I wanted to let you know there may be a slight delay due to longer checkout lines at the store. I appreciate your patience and will be there as soon as possible.",
                tags: ["delivery", "delay"],
                platformTags: [
                    .instacart: ["delay"],
                    .shipt: ["delay"],
                    .amazon_fresh: ["delay"]
                ]
            ),

            // Follow Up
            Prompt(
                title: "Checking In",
                content: "Just checking in -- I sent a message about a substitution a few minutes ago. Would you like to go with the replacement, or would you prefer a refund?",
                tags: ["followUp"],
                platformTags: [
                    .instacart: ["followUp"],
                    .shipt: ["followUp"]
                ]
            ),
            Prompt(
                title: "No Response Proceeding",
                content: "I haven't heard back yet, so I'll go ahead and use my best judgment on the substitution. If you'd like to change anything, just let me know before I check out.",
                tags: ["followUp"],
                platformTags: [
                    .instacart: ["followUp"],
                    .shipt: ["followUp"],
                    .amazon_fresh: ["followUp"]
                ]
            ),

            // Closing
            Prompt(
                title: "Thank You",
                content: "Your order has been delivered. Thank you for shopping with me today! If everything looks good, I'd appreciate a rating. Have a great day!",
                tags: ["closing"],
                platformTags: [
                    .instacart: ["closing"],
                    .shipt: ["closing"],
                    .amazon_fresh: ["closing"]
                ]
            ),
            Prompt(
                title: "Leave at Door",
                content: "I've left your groceries at the door as requested. Everything is bagged and organized. Thank you and have a wonderful day!",
                tags: ["closing", "delivery"],
                platformTags: [
                    .instacart: ["closing"],
                    .shipt: ["closing"],
                    .amazon_fresh: ["closing"]
                ]
            ),
        ]
    }
}

