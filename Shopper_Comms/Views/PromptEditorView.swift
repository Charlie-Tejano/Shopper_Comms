//
//  PromptEditorView.swift
//  Shopper_Comms
//
//  Created by Charles Tejano on 2/17/26.
//

import SwiftUI

struct PromptEditorScreen: View {
    @ObservedObject var viewModel: PromptEditorVM
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("Prompt title", text: $viewModel.title)
                }

                Section("Message") {
                    TextEditor(text: $viewModel.content)
                        .frame(minHeight: 120)
                }

                Section("Tags (comma separated)") {
                    TextField("greeting, substitution, delivery", text: $viewModel.tagsText)
                        .autocapitalization(.none)
                }

                Section("Platforms") {
                    ForEach(Platform.allCases) { platform in
                        Toggle(isOn: Binding(
                            get: { viewModel.selectedPlatforms.contains(platform) },
                            set: { isOn in
                                if isOn {
                                    viewModel.selectedPlatforms.insert(platform)
                                } else {
                                    viewModel.selectedPlatforms.remove(platform)
                                }
                            }
                        )) {
                            HStack(spacing: 8) {
                                PlatformIconView(platform: platform, size: 24)
                                Text(platform.displayName)
                            }
                        }
                    }
                }

                if !viewModel.selectedPlatforms.isEmpty {
                    Section("Platform Tags (comma separated)") {
                        ForEach(Array(viewModel.selectedPlatforms).sorted { $0.rawValue < $1.rawValue }) { platform in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(platform.displayName)
                                    .font(.caption.weight(.semibold))
                                    .foregroundStyle(.secondary)
                                TextField("Tags for \(platform.displayName)", text: Binding(
                                    get: { viewModel.platformTagsText[platform] ?? "" },
                                    set: { viewModel.platformTagsText[platform] = $0 }
                                ))
                                .autocapitalization(.none)
                            }
                        }
                    }
                }
            }
            .navigationTitle(viewModel.isEditing ? "Edit Prompt" : "New Prompt")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.save()
                        Haptics.success()
                        dismiss()
                    }
                    .disabled(!viewModel.isValid)
                }
            }
        }
    }
}

#Preview {
    PromptEditorScreen(viewModel: PromptEditorVM(store: LocalPromptStore()))
}