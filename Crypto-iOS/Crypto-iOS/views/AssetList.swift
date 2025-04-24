import SwiftUI

struct AssetList: View {
    
    var viewModel: AssetListViewModel = .init()
    
    var body: some View {
        NavigationStack{
            Text(viewModel.errorMessage ?? "")
            List {
                ForEach(viewModel.assets) { asset in
                    NavigationLink{
                        AssetDetailView(viewModel: .init(asset: <#T##Asset#>))
                    } label: {
                        AssetView(assetViewState: .init(asset))
                    }
                    
                }
            }
            .listStyle(.plain)
            /*.onAppear{}
            .onDisappear{         }*/
            .listStyle(.plain)
            .task {
                await viewModel.fetchAssets()
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    AssetList()
}
