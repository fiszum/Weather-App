//
//  LoadingView.swift
//  Weather App
//
//  Created by Filip Szumotalski on 19/02/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.blue.opacity(0.2)]), startPoint: .top, endPoint: .bottom)) 
    }
}

#Preview {
    LoadingView()
}
