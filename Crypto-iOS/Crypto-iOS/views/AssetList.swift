import SwiftUI

struct AssetList: View {
    
    var viewModel: AssetListViewModel = .init()
    
    var body: some View {
        Text(viewModel.errorMessage ?? "")
        List {
            ForEach(viewModel.assets) { asset in
                AssetView(assetViewState: .init(asset))
            }
        }
        .listStyle(.plain)
        .onAppear{
            
        }
        .onDisappear{
            
        }
        .task {
            await viewModel.fetchAssets()
        }
    }
}

#Preview {
    AssetList()
}
