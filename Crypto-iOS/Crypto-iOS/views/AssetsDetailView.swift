import SwiftUI

struct AssetDetailView: View {
    let viewModel: AssetDetailsViewModel

    var body: some View {
        VStack {
            Text(viewModel.asset.name)
            Button {
                viewModel.addToFavourites()
            } label: {
                Text("Add to favourites")
            }
        }
        .navigationTitle(viewModel.asset.name)
        .alert(viewModel.errorMssage ?? "",
        isPresented: $viewModel.showError){
            Button("OK"){}
        }
        }
    }
}

#Preview {
    NavigationStack {
        AssetDetailView(
            viewModel: .init(
                asset: .init(
                    id: "bitcoin",
                    name: "Bitcoin",
                    symbol: "BTC",
                    priceUsd: "123123.123123",
                    changePercent24Hr: "9.99292"
                )
            )
        )
    }
}
