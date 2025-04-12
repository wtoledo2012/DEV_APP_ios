import Testing

@testable import Crypto_iOS

struct AssetListViewModelTests{
    @Test func clientConfigured() {
        let viewModel = AssetListViewModel()

        viewModel.configClient()

        #expect(viewModel.clientConfigured == true)
    }

    @Test func fetchAssetsFailure() async throws {
        let viewModel = withDependencies {
            $0.assetsApiClient = .mockWithFailure
        } operation: {
            AssetListViewModel()
        }

        await viewModel.fetchAssets()

        #expect(viewModel.errorMessage == "Invalid URL")
    }
    
}
