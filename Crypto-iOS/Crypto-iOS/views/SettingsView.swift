import SwiftUI
struct SettingsView:View{
    @State var viewModel: SettingsViewModel = SettingsViewModel()

    var body: some View {
        loginForm()
            .alert(
                viewModel.errorMessage,
                isPresented: $viewModel.showError) {
                    Button("OK") { }
                }
    }
    
    @ViewBuilder
    func userView(user: User) -> some View {
        VStack {
        }
    }
    
    @ViewBuilder
    func loginForm() -> some View {
        TextField(text: $ViewModel.email){
            
        }
    }
}
