import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: "cart.fill")
                    .font(.system(size: 64))
                    .foregroundStyle(.tint)

                Text("Shopper Comms")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Instacart  |  Shipt  |  Amazon Fresh")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                ProgressView()
                    .padding(.top, 24)
            }
        }
    }
}

#Preview {
    SplashView()
}
