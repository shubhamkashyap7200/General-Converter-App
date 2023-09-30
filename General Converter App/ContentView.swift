//
//  ContentView.swift
//  General Converter App
//
//  Created by Shubham on 30/09/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @State private var selectedFirstUnit = "milliliters"
    @State private var selectedSecondUnit = "liters"
    @State private var inputValue = "1"
    
    let allVolumeUnits = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    private var finalConversionOutput: Double {
        let inputValue = Double(inputValue) ?? 1.0
        
        switch selectedFirstUnit {
        case "milliliters":
            switch selectedSecondUnit {
            case "milliliters":
                return inputValue
            case "liters":
                return inputValue * 0.001
            case "cups":
                return inputValue * 0.00422675
            case "pints":
                return inputValue * 0.00211338
            case "gallons":
                return inputValue * 0.000264172

            default:
                return inputValue
            }
            
        case "liters":
            switch selectedSecondUnit {
            case "milliliters":
                return inputValue * 1000
            case "liters":
                return inputValue
            case "cups":
                return inputValue * 4.22675
            case "pints":
                return inputValue * 2.11338
            case "gallons":
                return inputValue * 0.264172

            default:
                return inputValue
            }
            
        case "cups":
            switch selectedSecondUnit {
            case "milliliters":
                return inputValue * 236.588
            case "liters":
                return inputValue * 0.236588
            case "cups":
                return inputValue
            case "pints":
                return inputValue * 0.5
            case "gallons":
                return inputValue * 0.0625

            default:
                return inputValue
            }
            
        case "pints":
            switch selectedSecondUnit {
            case "milliliters":
                return inputValue * 568.261
            case "liters":
                return inputValue * 0.473176
            case "cups":
                return inputValue * 2.4019
            case "pints":
                return inputValue
            case "gallons":
                return inputValue * 0.150119

            default:
                return inputValue
            }
            
        case "gallons":
            switch selectedSecondUnit {
            case "milliliters":
                return inputValue * 3785.41
            case "liters":
                return inputValue * 3.78541
            case "cups":
                return inputValue * 16
            case "pints":
                return inputValue * 8
            case "gallons":
                return inputValue

            default:
                return inputValue
            }

            
        default:
            return inputValue
        }
    }
    
    
    // MARK: Body
    var body: some View {
        NavigationStack{
            Form {
                
                // MARK: First Unit Section
                Section {
                    Picker("From", selection: $selectedFirstUnit) {
                        ForEach(allVolumeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("To", selection: $selectedSecondUnit) {
                        ForEach(allVolumeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    
                } header: {
                    Text("Select the units to convert")
                }
                
                // MARK: Input Section
                Section {
                    TextField("Enter the input value", text: $inputValue)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Input value")
                }
                
                // MARK: Output Section
                Section {
                    Text("\(finalConversionOutput)")
                } header: {
                    Text("Conversion Output")
                }
                
            }
            
            .navigationTitle("Volume Converter")
        }
    }
}

#Preview {
    ContentView()
}
