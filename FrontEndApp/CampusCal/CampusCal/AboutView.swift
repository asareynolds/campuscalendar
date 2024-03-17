//
//  AboutView.swift
//  CampusCal
//
//  Created by Ryan Nair on 3/16/24.
//

import SwiftUI

private struct AboutLabelView: View {

    let labelTitle: String
    let labelImage: String

    var body: some View {
        HStack {
            Text(labelTitle.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

private struct AboutRowView: View {

    let title: String
    let content: String
    var linkDestination: String?

    var body: some View {
        VStack {
            Divider()
                .padding(.vertical, 4)
            HStack {
                Text(title)
                    .foregroundStyle(.secondary)
                Spacer()
                if let linkDestination, let url = URL(string: linkDestination) {
                    Link(destination: url) {
                        Text(content)
                    }
                } else {
                    Text(content)
                }
            }
        }
    }
}

struct AboutView: View {
    @AppStorage("customTintColor") private var storedColor = 0
    @State private var isShowingDialog = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                GroupBox {
                    Divider().padding(.vertical, 4)
                    HStack(alignment: .center, spacing: 10) {
                        Text("CampusCal is designed to ...")
                            .font(.footnote)
                            .padding()
                    }
                } label: {
                    AboutLabelView(labelTitle: "CampusCal", labelImage: "info.circle")
                }

                GroupBox {
                    AboutRowView(title: "Developed by", content: "Eva Gunn, Aiden Johnson Ryan Nair, Asa Reynolds, and Jason Selsley")
                    AboutRowView(title: "GitHub", content: "Source Code", linkDestination: "https://github.com/asareynolds/campuscalendar")
                    VStack {
                        Divider().padding(.vertical, 4)
                        HStack {
                            Text("Tint Color").foregroundStyle(.secondary)
                            Spacer()
                            Picker("", selection: $storedColor, content: {
                                   Text("Red").tag(4)
                                   Text("Orange").tag(1)
                                   Text("Green").tag(2)
                                   Text("Teal").tag(3)
                                   Text("Blue").tag(0)
                                   Text("Purple").tag(5)
                                   Text("Indigo").tag(6)
                               })
                            .onChange(of: storedColor, {
                                swizzleCustomTintColor()
                            })
                        }
                        Divider().padding(.vertical, 4)
                        HStack {
                            Text("Reset Preferences").foregroundStyle(.secondary)
                            Spacer()
                            Button("Click to delete") {
                                isShowingDialog = true
                            }
                            .confirmationDialog("Are you sure?", isPresented: $isShowingDialog) {
                                Button("Delete Preferences", role: .destructive) {
                                    UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier.unsafelyUnwrapped)
                                }
                            }
                        }
                    }
                } label: {
                    AboutLabelView(labelTitle: "Application", labelImage: "apps.iphone")
                }
            }
        }
        .padding()
        .navigationTitle("About")
    }
}
#Preview {
    AboutView()
}
