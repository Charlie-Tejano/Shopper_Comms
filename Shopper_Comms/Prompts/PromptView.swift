//
//  PromptView.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/16/26.
//

import SwiftUI
import Foundation
import Combine

struct PromptListScreen: View {
    @ObservedObject var store: LocalPromptStore
    @StateObject private var viewModel: PromptListVM

    init(store: LocalPromptStore) {
        self.store = store
        _viewModel = StateObject(wrappedValue: PromptListVM(store: store))
    }

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.filteredPrompts.isEmpty {
                    if viewModel.filter.isActive {
                        EmptyStateView(
                            title: "No Results",
                            message: "No prompts match your current filters. Try adjusting your search or filters.",
                            systemImage: "magnifyingglass"
                        )
                    } else {
                        EmptyStateView(
                            title: "No Prompts Yet",
                            message: "Add your first prompt to start saving time with customer messages.",
                            systemImage: "text.bubble",
                            buttonTitle: "Add Prompt",
                            action: { viewModel.presentNewPrompt() }
                        )
                    }
                } else {
                    List {
                        ForEach(viewModel.filteredPrompts) { prompt in
                            NavigationLink {
                                PromptDetailScreen(
                                    viewModel: PromptDetailVM(prompt: prompt, store: store)
                                )
                            } label: {
                                PromptCard(prompt: prompt)
                            }
                        }
                        .onDelete { offsets in
                            viewModel.deletePrompt(at: offsets)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Shopper Comms")
            .searchable(text: $viewModel.filter.searchText, prompt: "Search prompts")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu {
                        // Platform filter
                        Menu("Platform") {
                            Button("All Platforms") {
                                viewModel.filter.selectedPlatform = nil
                            }
                            ForEach(Platform.allCases) { platform in
                                Button {
                                    viewModel.filter.selectedPlatform = platform
                                } label: {
                                    HStack {
                                        Text(platform.displayName)
                                        if viewModel.filter.selectedPlatform == platform {
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                }
                            }
                        }

                        // Category filter
                        Menu("Category") {
                            Button("All Categories") {
                                viewModel.filter.selectedCategory = nil
                            }
                            ForEach(PromptCategory.allCases) { category in
                                Button {
                                    viewModel.filter.selectedCategory = category
                                } label: {
                                    HStack {
                                        Text(category.displayName)
                                        if viewModel.filter.selectedCategory == category {
                                            Image(systemName: "checkmark")
                                        }
                                    }
                                }
                            }
                        }

                        if viewModel.filter.isActive {
                            Divider()
                            Button("Clear Filters", role: .destructive) {
                                viewModel.filter = FilterCriteria()
                            }
                        }
                    } label: {
                        Image(systemName: viewModel.filter.isActive ? "line.3.horizontal.decrease.circle.fill" : "line.3.horizontal.decrease.circle")
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.presentNewPrompt()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingEditor) {
                PromptEditorScreen(
                    viewModel: PromptEditorVM(store: store, prompt: viewModel.promptToEdit)
                )
            }
        }
    }
}

#Preview {
    PromptListScreen(store: LocalPromptStore())
}

