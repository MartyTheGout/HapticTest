
import SwiftUI

struct HapticTestView: View {
    @StateObject var viewModel = HapticTestViewModle()
    
    var body: some View {
        
            VStack(spacing: 12){
                Text("햅틱 테스트")
                    .font(.title)
                    .fontWeight(.bold)
                    
                VStack {
                    Button("Setting Counter As 0") {
                        viewModel.counter = 0
                    }
                }
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.2))
                
                VStack {
                    Picker("SensoryFeedback", selection: $viewModel.sensorStyle) {
                        IterationView(values: viewModel.hapticStyles)
                        
                    }
                    
                    Button(action: {viewModel.counter += 1}) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.hapticButton.gradient)
                            .frame(width: 300, height: 100)
                            .overlay() {
                                Text("Default Style Haptic: \(viewModel.counter)")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.text)
                            }
                    }.sensoryFeedback(viewModel.returnSensoryFeedback(), trigger: viewModel.counter)
                }
                .padding()
                
                Divider()
                    .frame(minHeight: 2)
                    .background(.hapticButton)
                
                
                VStack {
                    Picker("flexibility", selection: $viewModel.flexibility) {
                        IterationView( values: viewModel.flexibilityValues)
                    }.pickerStyle(.segmented)
                    
                    Stepper {
                        Text("Intensity \(viewModel.intensity)")
                    } onIncrement: {
                        viewModel.increaseIntensity()
                    } onDecrement: {
                        viewModel.decreaseIntensity()
                    }
                    .padding(.horizontal)
                    
                    Button(action: {viewModel.counter += 1}) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.hapticButton.gradient)
                            .frame(width: 300, height: 100)
                            .overlay() {
                                Text("Impact using Flexi: \(viewModel.counter)")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.text)
                            }
                    }
                    .sensoryFeedback(.impact(flexibility: viewModel.returnFlexibility(), intensity: viewModel.intensity), trigger: viewModel.counter)
                }
                
                
                Divider()
                    .frame(minHeight: 2)
                    .background(.hapticButton)
                
                VStack {
                    Picker("weight", selection: $viewModel.weight
                    ) {
                        IterationView(values: viewModel.weightValues)
                    }.pickerStyle(.segmented)
                    
                    
                    Stepper {
                        Text("Intensity \(viewModel.intensity)")
                    } onIncrement: {
                        viewModel.increaseIntensity()
                    } onDecrement: {
                        viewModel.decreaseIntensity()
                    }
                    .padding(.horizontal)
                    
                    Button(action: {viewModel.counter += 1}) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.hapticButton.gradient)
                            .frame(width: 300, height: 100)
                            .overlay() {
                                Text("Impact using Weight: \(viewModel.counter)")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundStyle(.text)
                            }
                    }.sensoryFeedback(.impact(weight: viewModel.returnWeight(), intensity: viewModel.intensity), trigger: viewModel.counter)
                }
            }
            .frame(maxHeight: .infinity)
            .background(.back.opacity(0.85))
    }
}

#Preview {
    HapticTestView()
}
