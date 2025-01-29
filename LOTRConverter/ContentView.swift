import SwiftUI
import TipKit

struct ImageName {
    var showExchangeInfo: Bool
    var numberOfCurreny: Int
}
struct ContentView: View {
    // create a new stored property
    @State var showExchangeInfo: Bool = false
    @State private var leftAmount: String = ""
    @State private var rightAmount: String = ""
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @State var showSelectCurrency: Bool = false
    
    @FocusState private var leftFieldTyping: Bool
    @FocusState private var rightFieldTyping: Bool
    
    let currencyTip = CurrencyTipKit()

    
    var body: some View {
        ZStack {
            // Background Image of the App
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            // VStack
            VStack {
                // Prancing pony image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                // The width of image changes too when only set the height in frame(). because of the scaledToFit() modifier. So the width of image always changes to match whatever height we do, to make sure image looks normal
                    .frame(height: 200)
                
                // Currency exchange text
                Text("Curreny exchange")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                
                
                // Conversion section. This needs to be done by the H stack
                HStack {
                    // Left conversion section
                    VStack {
                        // Currency
                        HStack {
                            // Curreny Image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            // currency name text
                            Text(leftCurrency.name.capitalized)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom , -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            // do not show the tip again, when the user has already seen it
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        // popup tip kit
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                        // Text field
                        TextField("Amount", text: $leftAmount)
                            .keyboardType(.decimalPad) // Ensure the keyboard is set to decimal pad
                            .textFieldStyle(.roundedBorder)
                            .focused($leftFieldTyping)
                        
                    }
                    
                    
                    // Equal sign- using SF symbol
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    //TODO: check .symbolEffect(.pulse)
                        .symbolEffect(.pulse)
                    
                    
                    // Right conversion section
                    VStack{
                        // Currency
                        HStack{
                            // Currency name Text
                            Text(rightCurrency.name.capitalized)
                                .font(.headline)
                                .foregroundStyle(.white)
                            // Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom , -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            // do not show the tip again, when the user has already seen it
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        // Text field
                        TextField("Amount", text: $rightAmount)
                            .keyboardType(.decimalPad) // Ensure the keyboard is set to decimal pad
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightFieldTyping)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                
                // Space
                Spacer()
                
                // Info button
                HStack{
                    Spacer()
                    
                    Button {
                        // Button action goes here
                        
                        // toggle the value of stae "showExchangeInfo"
                        showExchangeInfo.toggle()
                    } label:{
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo){
                        ExchangeInfoView()
                    }
                }
                
            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftFieldTyping {
                rightAmount = leftCurrency.convert(amountString: leftAmount, currency: rightCurrency)
            }
        } // => The reason before the sheet() modifier, is because the sheet() modifier is a view modifier, and it can only be used on a view. So, we need to put the onChange() modifier before the sheet() modifier.
        .onChange(of: rightAmount) {
            if rightFieldTyping {
                leftAmount = rightCurrency.convert(amountString: rightAmount, currency: leftCurrency)
            }
        }
        .onTapGesture {
            leftFieldTyping = false
            rightFieldTyping = false
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(amountString: rightAmount, currency: leftCurrency)
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(amountString: leftAmount, currency: rightCurrency)
        }
        .sheet(isPresented: $showSelectCurrency){
            SelectCurrency(startWith: $leftCurrency, convertTo: $rightCurrency)
        }
        
    }
}


// Tell Xocde to preview the View by using #Preview
#Preview {
    ContentView()
    
}
