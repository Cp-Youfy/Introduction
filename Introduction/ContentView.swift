
import SwiftUI



struct ContentView: View {
    
    var sentences = [
        Sentence(answer: "", reply:"What...?"),
        Sentence(answer:"I've run out of creativity, so what do you want to know?", reply:"Umm...how about basic information?"),
        Sentence(answer:"Age 14, Female. Why doesn't SF seem to have gender emotes? ;w;", reply: "Sure. What are your hobbies?"),
        Sentence(answer: "Random stuff. Most likely not debugging.", reply: "Okay. Anything else?"),
        Sentence(answer: "", reply: "")
    ]
    @State private var currentStatement = 0
    @State private var buttonEnabled = true
    @State private var showSheet = false
    var body: some View {
        VStack {
            VStack{
                Text("Hi, I'm")
                    .padding()
                
                Text("Siying")
                    .gradientForeground(colors: [.red, .orange,.yellow])
                    .font(.system(size: 40.0, weight: .bold, design: .rounded))
                    .padding()
            }
            
            if currentStatement == 2 {
                
                Image("Katchan")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150, alignment: .center)
                    .padding()
                    .mask(Circle())
            }
            
            Text(sentences[currentStatement].answer)
                .padding()
                .animation(.easeInOut)
            
            Button(sentences[currentStatement].reply)
            {
                if buttonEnabled {
                    if currentStatement < sentences.count - 2 {
                        currentStatement += 1
                        print(sentences.count)
                    }
                    else {
                        buttonEnabled = false
                        showSheet.toggle()
                    }
                }
            }
            .foregroundColor(.white)
            .background(Color.blue)
            .animation(.easeInOut)
            .sheet(isPresented: $showSheet) {
                emailSheet()
            }
        }
    }
}

struct emailSheet: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        Button() {
            openURL(URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!)
            
        } label: {
            Image(systemName: "envelope")
            Text("Email me more questions!")
        }
        
        
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
