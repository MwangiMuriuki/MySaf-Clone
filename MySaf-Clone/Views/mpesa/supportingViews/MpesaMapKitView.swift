//
//  MpesaMapKitView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 04/04/2024.
//

import SwiftUI
import WebKit

struct MpesaMapKitView: View {
    @State var linkToLoad: Binding<String?>

    var body: some View {
        VStack(content: {
            MpesaWebView(webLink: linkToLoad)
        })
    }
}

#Preview {
    MpesaMapKitView(linkToLoad: .constant("https://www.safaricom.co.ke/"))
}

struct MpesaWebView: UIViewRepresentable {
    @Binding var webLink: String!
//    let webView: WKWebView

//    init() {
//        webView = WKWebView(frame: .zero)
//    }

//    func makeCoordinator() -> MpesaWebView.Coordinator {
//        return MpesaWebView.Coordinator(parent1: self)
//    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: .zero)
        webView.load(URLRequest(url: URL(string: webLink)!))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
//        webView.load(URLRequest(url: URL(string: "https://www.safaricom.co.ke/")!))
    }

//    class Coordinator: NSObject {
//        var parent: MpesaWebView
//
//        init(parent1: MpesaWebView) {
//            parent = parent1
//        }
//
//    }
}
