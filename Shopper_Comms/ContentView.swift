//
//  ContentView.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

// Data Models
struct ShopperPrompt: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}

struct ShopperPromptCategory: Identifiable {
    let id = UUID()
    let name: String
    let prompts: [ShopperPrompt]
}

// Prompt Data
struct PromptData {
    static let categories: [ShopperPromptCategory] = [
        ShopperPromptCategory(
            name: "Greeting / Introduction",
            prompts: [
                ShopperPrompt(
                    title: "Standard Greeting",
                    message: "Hi! This is your shopper. I'm starting on your order now. If you have any special requests or preferences, feel free to let me know. I'll reach out if I have any questions."
                ),
                ShopperPrompt(
                    title: "Large Order Greeting",
                    message: "Hi! This is your shopper. I see you have a larger order today, so I want to make sure everything is perfect. I'll keep you updated as I shop. Please let me know if you have any preferences on replacements."
                ),
                ShopperPrompt(
                    title: "Greeting with Timeline",
                    message: "Hi! This is your shopper and I'm getting started on your order right now. I expect to be done shopping in about 20-30 minutes and will head your way shortly after. Let me know if you need anything specific."
                )
            ]
        ),
        ShopperPromptCategory(
            name: "Item Unavailable / Substitution",
            prompts: [
                ShopperPrompt(
                    title: "Out of Stock - Ask for Sub",
                    message: "Unfortunately, the [ITEM] you requested is out of stock today. Would you like me to substitute it with a similar option, or would you prefer a refund for that item?"
                ),
                ShopperPrompt(
                    title: "Suggest Specific Replacement",
                    message: "The [ITEM] is currently unavailable. I found [REPLACEMENT ITEM] which is a similar product at a comparable price. Would you like me to grab that instead, or would you prefer something else?"
                ),
                ShopperPrompt(
                    title: "Multiple Items Unavailable",
                    message: "I wanted to let you know that a few items on your list are currently out of stock: [LIST ITEMS]. Would you like me to find substitutes for each, or would you prefer refunds? Just let me know your preference."
                ),
                ShopperPrompt(
                    title: "Size/Brand Variant Available",
                    message: "The exact size/brand of [ITEM] you requested isn't available, but they do have [ALTERNATIVE SIZE/BRAND]. Would that work for you, or would you prefer I skip this item?"
                ),
                ShopperPrompt(
                    title: "No Response - Making Decision",
                    message: "I haven't heard back regarding the [ITEM] that was out of stock. I'm going to go ahead and [select the closest substitute / refund the item] to keep things moving. If you'd like to change that, just let me know."
                )
            ]
        ),
        ShopperPromptCategory(
            name: "Produce / Quality Check",
            prompts: [
                ShopperPrompt(
                    title: "Produce Quality Update",
                    message: "I wanted to let you know that the [PRODUCE ITEM] selection today isn't the best quality. Would you still like me to pick the best ones available, or would you prefer I skip it?"
                ),
                ShopperPrompt(
                    title: "Ripeness Preference",
                    message: "Do you have a preference on ripeness for the [BANANAS/AVOCADOS/etc.]? Would you like them ready to eat today, or a bit greener so they last longer?"
                ),
                ShopperPrompt(
                    title: "Deli / Bakery Confirmation",
                    message: "I'm at the deli/bakery counter now. Did you have any specific preferences for how the [ITEM] should be sliced or prepared?"
                )
            ]
        ),
        ShopperPromptCategory(
            name: "Delivery Updates",
            prompts: [
                ShopperPrompt(
                    title: "On the Way",
                    message: "Good news - I've finished shopping your order and I'm on my way to you now. My estimated arrival is about [X] minutes. Please let me know if there are any special delivery instructions."
                ),
                ShopperPrompt(
                    title: "Arriving Soon",
                    message: "I'm just a few minutes away from your location. I'll follow your delivery instructions. Please let me know if anything has changed."
                ),
                ShopperPrompt(
                    title: "Delivery Completed",
                    message: "Your order has been delivered! Everything has been placed [at your door / as instructed]. Thank you for your order, and I hope everything looks great. Have a wonderful day!"
                ),
                ShopperPrompt(
                    title: "Gate Code / Access Needed",
                    message: "I've arrived at your location but I need a gate code or access instructions to reach your door. Could you please share that with me? Thank you!"
                ),
                ShopperPrompt(
                    title: "Address Clarification",
                    message: "I'm having a bit of trouble locating your exact drop-off spot. Could you provide any additional details such as an apartment number, building color, or landmark nearby? I want to make sure your order gets to the right place."
                ),
                ShopperPrompt(
                    title: "Nobody Home - Leaving Order",
                    message: "I've arrived with your order. It doesn't look like anyone is home, so I'll leave your groceries [at the front door / in a safe spot] as instructed. I'll take a photo for your records. Thank you!"
                )
            ]
        ),
        ShopperPromptCategory(
            name: "Delays / Issues",
            prompts: [
                ShopperPrompt(
                    title: "Store is Busy - Delay",
                    message: "I wanted to give you a heads up that the store is quite busy today, so things are taking a bit longer than usual. I'm working as efficiently as I can and will keep you posted on my progress."
                ),
                ShopperPrompt(
                    title: "Long Checkout Line",
                    message: "I've finished gathering all your items but the checkout lines are a bit long right now. I should be on my way to you shortly. Thank you for your patience!"
                ),
                ShopperPrompt(
                    title: "Traffic Delay",
                    message: "I'm on my way with your order, but traffic is a bit heavier than expected. I may be a few minutes later than the original estimate. I apologize for the delay and I'm doing my best to get there as quickly as possible."
                ),
                ShopperPrompt(
                    title: "Unexpected Issue",
                    message: "I ran into an unexpected issue with your order: [DESCRIBE ISSUE]. I'm working to resolve it as quickly as I can. I apologize for any inconvenience and will update you shortly."
                )
            ]
        ),
        ShopperPromptCategory(
            name: "Thank You / Closing",
            prompts: [
                ShopperPrompt(
                    title: "Standard Thank You",
                    message: "Thank you for your order today! I hope everything is to your satisfaction. If you have a moment, I'd really appreciate a rating. Have a great rest of your day!"
                ),
                ShopperPrompt(
                    title: "Holiday / Weekend Closing",
                    message: "Your order is all set! Thank you for choosing to shop with us today. I hope you enjoy your weekend and that everything meets your expectations."
                ),
                ShopperPrompt(
                    title: "After Difficult Order",
                    message: "Thank you so much for your patience today with the substitutions and changes. I hope everything works out well. I appreciate your understanding, and I hope I can shop for you again in the future!"
                )
            ]
        ),
        ShopperPromptCategory(
            name: "Special Situations",
            prompts: [
                ShopperPrompt(
                    title: "ID Required for Alcohol",
                    message: "Your order contains alcohol, so I'll need to verify your ID at the time of delivery. Please make sure someone 21 or older is available to receive the order. Thank you!"
                ),
                ShopperPrompt(
                    title: "Heavy / Bulky Items",
                    message: "I have your order ready, which includes some heavier items. Is there a preferred spot where you'd like me to set them down? I want to make sure they're placed conveniently for you."
                ),
                ShopperPrompt(
                    title: "Cold / Frozen Items Note",
                    message: "Just a heads up - your order includes some cold and frozen items. I have them packed carefully to stay cool during transit. I'd recommend putting them away soon after delivery to keep everything fresh."
                ),
                ShopperPrompt(
                    title: "Damaged Packaging",
                    message: "I noticed that the packaging on [ITEM] was slightly damaged, but the product inside appears to be fine. I went ahead and grabbed it, but I wanted to let you know. If you'd prefer, I can look for another one."
                )
            ]
        )
    ]
}

// Green Header Appearance
struct GreenNavigationBarModifier: ViewModifier {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.18, green: 0.65, blue: 0.35, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }

    func body(content: Content) -> some View {
        content
    }
}

struct ContentView: View {
    @State private var searchText = ""
    @State private var copiedPromptID: UUID?

    var filteredCategories: [ShopperPromptCategory] {
        if searchText.isEmpty {
            return PromptData.categories
        }
        return PromptData.categories.compactMap { category in
            let matchingPrompts = category.prompts.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.message.localizedCaseInsensitiveContains(searchText)
            }
            if matchingPrompts.isEmpty { return nil }
            return ShopperPromptCategory(name: category.name, prompts: matchingPrompts)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredCategories) { category in
                    Section {
                        ForEach(category.prompts) { prompt in
                            PromptRow(prompt: prompt, copiedPromptID: $copiedPromptID)
                                .listRowBackground(Color.white)
                        }
                    } header: {
                        Text(category.name)
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .textCase(nil)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background(Color(UIColor.systemGroupedBackground))
            .navigationTitle("Communication Toolkit")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "Search prompts...")
            .overlay {
                if filteredCategories.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                }
            }
            .modifier(GreenNavigationBarModifier())
        }
    }
}

struct PromptRow: View {
    let prompt: ShopperPrompt
    @Binding var copiedPromptID: UUID?
    @State private var isExpanded = false

    var isCopied: Bool {
        copiedPromptID == prompt.id
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isExpanded.toggle()
                }
            } label: {
                HStack {
                    Text(prompt.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                        .multilineTextAlignment(.leading)

                    Spacer()

                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .buttonStyle(.plain)

            if isExpanded {
                Text(prompt.message)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.vertical, 4)
                    .textSelection(.enabled)
                    .transition(.opacity.combined(with: .move(edge: .top)))

                HStack {
                    Button {
#if canImport(UIKit)
                        UIPasteboard.general.string = prompt.message
#endif
                        withAnimation {
                            copiedPromptID = prompt.id
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                if copiedPromptID == prompt.id {
                                    copiedPromptID = nil
                                }
                            }
                        }
                    } label: {
                        Label(
                            isCopied ? "Copied!" : "Copy to Clipboard",
                            systemImage: isCopied ? "checkmark.circle.fill" : "doc.on.doc"
                        )
                        .font(.caption)
                        .fontWeight(.medium)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(isCopied ? Color.green.opacity(0.15) : Color.accentColor.opacity(0.1))
                        .foregroundStyle(isCopied ? .green : .accentColor)
                        .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)

                    Spacer()
                }
                .transition(.opacity)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}
