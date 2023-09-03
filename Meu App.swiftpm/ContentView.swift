import SwiftUI



struct ContentView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 30) {
                    Button {
                        viewModel.greenButtonPressed()
                    } label: {
                        Capsule(style: .circular)
                            .frame(width: 100, height: 10)
                            .shadow(color: viewModel.isGreenActive ? .white : .black, radius: 5, y: 2 )
                            
                    }
                    
                    Button {
                        viewModel.redButtonPressed()
                    } label: {
                        Capsule(style: .circular)
                            .frame(width: 100, height: 10)
                            .foregroundColor(.red)
                            .shadow(color: viewModel.isRedActive ? .white : .black, radius: 5, y: 2 )
                    }

                    
                    Button {
                        viewModel.blueButtonPressed()
                    } label: {
                        Capsule(style: .circular)
                            .frame(width: 100, height: 10)
                            .foregroundColor(.blue)
                            .shadow(color: viewModel.isBlueActive ? .white : .black, radius: 5, y: 2 )
                    }

                    
                    Button {
                        viewModel.yellowButtonPressed()
                    } label: {
                        Capsule(style: .circular)
                            .frame(width: 100, height: 10)
                            .foregroundColor(.yellow)
                            .shadow(color: viewModel.isYellowActive ? .white : .black, radius: 5, y: 2 )
                    }


                }

                
                Spacer ()
                
                Button {
                    viewModel.startGame()
                } label: {
                    Text("Start")
                        .padding(.horizontal, 50)
                        .padding(.vertical, 10)
                        .background {
       
                            Color.white

                        }
                        .cornerRadius(10)
                }
                
            }
            

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
