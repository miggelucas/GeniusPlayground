import SwiftUI



struct ContentView: View {
    @GestureState private var isPressing = false
    @StateObject var viewModel = MainViewModel()
    
    var isOnMatch: Bool {
        viewModel.state != .off && viewModel.state != .idle
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
                
                gameStatusLedView
                
                Spacer()
                
                ColorGameButtons
                .overlay {
                  scoreLabelView
                }
                
                Spacer()
                
                genericGameButtons
                
                Spacer()
                
            }
            
            
        }
        
    }
    
    private var genericGameButtons: some View {
        HStack (spacing: 50) {
            GenericButton(style: .power, isActive: viewModel.isOn) {
                viewModel.powerButtonPressed()
            }
            
            GenericButton(style: .play, isActive: viewModel.isOn) {
                viewModel.startGame()
            }

        }

    }
    
    private var scoreLabelView: some View {
        Text("\(viewModel.score)")
            .font(.largeTitle)
            .foregroundColor(viewModel.isOn ? .accentColor : .gray)
            .shadow(color: viewModel.isOn ? .accentColor : .black, radius: 5)
    }
    
    private var gameStatusLedView: some View {
        HStack(spacing: 100) {
            VStack {
                Text("Playing")
                Circle()
                    .frame(width: 20)
                    .foregroundColor(isOnMatch ? .accentColor : .black)
                    .blur(radius: isOnMatch ? 0.5 : 0)
                    .shadow(color: isOnMatch ? .green : .black, radius: 2)
            }
            
            VStack {
                Text("Wait")
                Circle()
                    .frame(width: 20)
                    .foregroundColor(isPlaying ? .accentColor : .black)
                    .blur(radius: isPlaying ? 1 : 0)
                    .shadow(color: isPlaying ? .accentColor : .black, radius: 2)
            }
            
            
            VStack {
                Text("Chose")
                Circle()
                    .frame(width: 20)
                    .foregroundColor(isWaitingUser ? .accentColor : .black)
                    .blur(radius: isWaitingUser ? 1 : 0)
                    .shadow(color: isWaitingUser ? .accentColor : .black, radius: 2)
            }
            
        }
    }
    
    private var ColorGameButtons: some View {
        VStack(spacing: 30) {
            TrapezoidShape()
                .rotation(.degrees(180))
                .frame(width: 200, height: 75)
                .foregroundColor(viewModel.isOn ?  .green : .gray)
                .shadow(color: viewModel.isGreenActive ? .green : .black, radius: 5, y: 2 )
                .onTapGesture {
                    viewModel.ColorButtonPressed(move: .green)
                }
            
            HStack(spacing: 0) {
                
                TrapezoidShape()
                    .rotation(.degrees(90))
                    .frame(width: 200, height: 75)
                    .foregroundColor(viewModel.isOn ? .red : .gray)
                    .shadow(color: viewModel.isRedActive ? .red : .black, radius: 5, y: 2 )
                    .onTapGesture {
                        viewModel.ColorButtonPressed(move: .red)
                    }
                
                
                TrapezoidShape()
                    .rotation(.degrees(270))
                    .frame(width: 200, height: 75)
                    .foregroundColor(viewModel.isOn ? .blue : .gray)
                    .shadow(color: viewModel.isBlueActive ? .blue : .black, radius: 5, y: 2 )                            .onTapGesture {
                        viewModel.ColorButtonPressed(move: .blue)
                    }
                
            }
            
            
            TrapezoidShape()
                .frame(width: 200, height: 75)
                .foregroundColor(viewModel.isOn ? .yellow : .gray)
                .shadow(color: viewModel.isYellowActive ? .yellow : .black, radius: 5, y: 2 )
                .onTapGesture {
                    viewModel.ColorButtonPressed(move: .yellow)
                }
        
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
