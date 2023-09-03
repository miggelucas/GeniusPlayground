import SwiftUI

struct ContentView: View {
    
    var audioManager = AudioManager()
    
    @State var isGreenActive: Bool = false
    @State var isRedActive: Bool = false
    @State var isBlueActive: Bool = false
    @State var isYellowActive: Bool = false
    
    
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 30) {
                    Button {
                        audioManager.playeFXSound(sound: .pickupCoin1)
                    } label: {
                        Capsule(style: .circular)
                            .frame(width: 100, height: 10)
                            .shadow(color: isGreenActive ? .white : .black, radius: 5, y: 2 )
                            
                    }
                    
                    Button {
                        audioManager.playeFXSound(sound: .pickupCoin2)
                    } label: {
                        Capsule(style: .circular)
                            .frame(width: 100, height: 10)
                            .foregroundColor(.red)
                            .shadow(color: isRedActive ? .white : .black, radius: 5, y: 2 )
                    }

                    
                    Button {
                        audioManager.playeFXSound(sound: .pickupCoin3)
                    } label: {
                        Capsule(style: .circular)
                            .frame(width: 100, height: 10)
                            .foregroundColor(.blue)
                            .shadow(color: isBlueActive ? .white : .black, radius: 5, y: 2 )
                    }

                    
                    Button {
                        audioManager.playeFXSound(sound: .pickupCoin4)
                    } label: {
                        Capsule(style: .circular)
                            .frame(width: 100, height: 10)
                            .foregroundColor(.yellow)
                            .shadow(color: isYellowActive ? .white : .black, radius: 5, y: 2 )
                    }


                }
                
                
                Spacer ()
                
                Button {
                    
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
