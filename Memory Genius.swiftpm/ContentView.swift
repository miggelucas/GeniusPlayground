import SwiftUI



struct ContentView: View {
    @GestureState private var isPressing = false
    @StateObject var viewModel = MainViewModel()
    
    var isPlaying: Bool {
        viewModel.state == .playing
        
    }
    
    var isWaitingUser: Bool {
        viewModel.state == .waitingUserResponse
    }
    
    
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                gameStatusLedView
                
                Spacer()
                
                if viewModel.state == .idle {
                    VStack {
                         
                        
                        Picker(selection: $viewModel.mode) {
                            ForEach(GameMode.allCases, id: \.self) { mode in
                                Text(mode.rawValue)
                                    .foregroundColor(.red)
                            }
                        } label: {
                            Text("Select Dificulty")
                                .foregroundColor(.blue)
                        }
                    
                        
                    }
                    .pickerStyle(.segmented)
                    .foregroundColor(.white)
                    
                } else {
                    switch viewModel.mode {
                    case .easy:
                        colorGameEasy
                    case .medium:
                        colorGameMedium
                    case .hard:
                        colorGameHard
                    case .extreme:
                        colorGameExtreme
                    }
                    
                }
               
                
                Spacer()
                
                genericGameButtons
                
                Spacer()
                
            }
            
            
        }
        
    }
    
    private var genericGameButtons: some View {
        HStack (spacing: 50) {
            
            GenericButton(style: .play, isActive: viewModel.isOn) {
                viewModel.startGame()
            }

        }

    }
    
    private var scoreLabelView: some View {
        Text("\(viewModel.score)")
            .font(.largeTitle)
            .foregroundColor(viewModel.isOn ? .accentColor : .gray)
            .shadow(color: viewModel.isOn ? .accentColor : .black, radius: 1)
    }
    
    private var gameStatusLedView: some View {
        HStack(spacing: 100) {
            
            VStack {
                Text("Wait")
                    .foregroundColor(.accentColor)
                Circle()
                    .frame(width: 20)
                    .foregroundColor(isPlaying ? .accentColor : .black)
                    .blur(radius: isPlaying ? 1 : 0)
                    .shadow(color: isPlaying ? .accentColor : .black, radius: 2)
            }
            
            
            VStack {
                Text("Chose")
                    .foregroundColor(.accentColor)
                
                Circle()
                    .frame(width: 20)
                    .foregroundColor(isWaitingUser ? .accentColor : .black)
                    .blur(radius: isWaitingUser ? 1 : 0)
                    .shadow(color: isWaitingUser ? .accentColor : .black, radius: 2)
            }
            
        }
    }
    
    private var colorGameEasy: some View {
        VStack {
            ColorButton(move: .red, shouldGlow: $viewModel.isRedActive)
            HStack {
                ColorButton(move: .blue, shouldGlow: $viewModel.isBlueActive)
                
                ColorButton(move: .green, shouldGlow: $viewModel.isGreenActive)
            }
        }
    }
    
    
    private var colorGameHard: some View {
        VStack(spacing: 5) {
            ColorButton(move: .red, shouldGlow: $viewModel.isRedActive)
            
            HStack(spacing: 80) {
                ColorButton(move: .blue, shouldGlow: $viewModel.isBlueActive)
                
                ColorButton(move: .green, shouldGlow: $viewModel.isGreenActive)
            }
            
            HStack(spacing: 20) {
                ColorButton(move: .blue, shouldGlow: $viewModel.isBlueActive)
                
                ColorButton(move: .green, shouldGlow: $viewModel.isGreenActive)
            }
        }
    }
    
    private var colorGameExtreme: some View {
        VStack {
            HStack(spacing: 30) {
                ColorButton(move: .blue, shouldGlow: $viewModel.isBlueActive)
                
                ColorButton(move: .green, shouldGlow: $viewModel.isGreenActive)
            }
            HStack(spacing: 150) {
                ColorButton(move: .blue, shouldGlow: $viewModel.isBlueActive)
                
                ColorButton(move: .green, shouldGlow: $viewModel.isGreenActive)
            }
            HStack(spacing: 30) {
                ColorButton(move: .blue, shouldGlow: $viewModel.isBlueActive)
                
                ColorButton(move: .green, shouldGlow: $viewModel.isGreenActive)
            }
            
        }
    }
    
    
    private var colorGameMedium: some View {
        VStack {
            HStack {
                ColorButton(move: .blue, shouldGlow: $viewModel.isBlueActive)
                    .onTapGesture {
                        viewModel.ColorButtonPressed(move: .blue)
                    }
                
                ColorButton(move: .red, shouldGlow: $viewModel.isRedActive)
                    .onTapGesture {
                        viewModel.ColorButtonPressed(move: .red)
                    }
                
                
            }
            
            HStack {
                ColorButton(move: .green, shouldGlow: $viewModel.isGreenActive)
                    .onTapGesture {
                        viewModel.ColorButtonPressed(move: .green)
                    }
                
                
                ColorButton(move: .yellow, shouldGlow: $viewModel.isYellowActive)
                    .onTapGesture {
                        viewModel.ColorButtonPressed(move: .yellow)
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
