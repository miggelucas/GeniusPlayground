import SwiftUI



struct ContentView: View {
    @GestureState private var isPressing = false
    @StateObject var viewModel = MainViewModel()
    
    var isOn: Bool {
        viewModel.state != .off
    }
    
    var isPlaying: Bool {
        viewModel.state == .playing
        
    }
    
    var isWaitingUser: Bool {
        viewModel.state == .waitingUserResponse
    }
    
    
    var body: some View {
        ZStack {
            Color(uiColor: .darkGray)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack(spacing: 100) {
                    VStack {
                        Text("Playing")
                        Circle()
                            .frame(width: 20)
                            .foregroundColor(isOn ? .green : .black)
                            .blur(radius: isOn ? 0.5 : 0)
                            .shadow(color: isOn ? .green : .black, radius: 2)
                    }
                    
                    VStack {
                        Text("Wait")
                        Circle()
                            .frame(width: 20)
                            .foregroundColor(isPlaying ? .green : .black)
                            .blur(radius: isPlaying ? 1 : 0)
                            .shadow(color: isPlaying ? .green : .black, radius: 2)
                    }
                    
                    
                    VStack {
                        Text("Chose")
                        Circle()
                            .frame(width: 20)
                            .foregroundColor(isWaitingUser ? .green : .black)
                            .blur(radius: isWaitingUser ? 1 : 0)
                            .shadow(color: isWaitingUser ? .green : .black, radius: 2)
                    }
                    
                }
                
                Spacer()
                
                VStack(spacing: 30) {
                    TrapezoidShape()
                        .rotation(.degrees(180))
                        .frame(width: 200, height: 75)
                        .foregroundColor(.green)
                        .shadow(color: viewModel.isGreenActive ? .green : .black, radius: 5, y: 2 )
                        .onTapGesture {
                            viewModel.greenButtonPressed()
                        }
                    
                    HStack(spacing: 0) {
                        
                        TrapezoidShape()
                            .rotation(.degrees(90))
                            .frame(width: 200, height: 75)
                            .foregroundColor(.red)
                            .shadow(color: viewModel.isRedActive ? .red : .black, radius: 5, y: 2 )
                            .onTapGesture {
                                viewModel.redButtonPressed()
                            }
                        
                        
                        TrapezoidShape()
                            .rotation(.degrees(270))
                            .frame(width: 200, height: 75)
                            .foregroundColor(.blue)
                            .shadow(color: viewModel.isBlueActive ? .blue : .black, radius: 5, y: 2 )                            .onTapGesture {
                                viewModel.blueButtonPressed()
                            }
                        
                    }
                    
                    
                    TrapezoidShape()
                        .frame(width: 200, height: 75)
                        .foregroundColor(.yellow)
                        .shadow(color: viewModel.isYellowActive ? .yellow : .black, radius: 5, y: 2 )
                        .onTapGesture {
                            viewModel.yellowButtonPressed()
                        }
                
                }
                
                Spacer()
                
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
                
                Spacer()
                
            }
            
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
