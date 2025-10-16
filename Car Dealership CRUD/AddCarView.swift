//
//  AddCarView.swift
//  Car Dealership CRUD
//
//  Created by Andrei Aldea on 16.10.2025.
//

import SwiftUI

struct AddCarView: View {
    @Environment(\.dismiss) var dismiss

    var onSave: (Car) -> Void

    // State variables for form inputs
    @State private var manufacturer = ""
    @State private var model = ""
    @State private var variant = ""
    @State private var color = ""
    @State private var year = 2024
    @State private var fuelType = "Petrol"
    @State private var engineSize = 2.0
    @State private var horsepower: Int?
    @State private var price = 40000

    let fuelTypes = ["Petrol", "Diesel", "Electric"]
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section(header: Text("Car Details")) {
                    TextField("Manufacturer", text: $manufacturer)
                    
                    TextField("Model", text: $model)
                    
                    TextField("Variant", text: $variant)
                    
                    TextField("Color", text: $color)
                    
                    Stepper("Year: \(year.formatted(.number.grouping(.never)))", value: $year, in: 1950...2026)
                    
                    TextField("Price", value: $price, format: .currency(code: "EUR"))
                        .keyboardType(.numberPad)
                
                }

                Section(header: Text("Engine Specifications")) {
                    Picker("Fuel Type", selection: $fuelType) {
                        ForEach(fuelTypes, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                    TextField("Horsepower", value: $horsepower, format: .number)
                        .keyboardType(.numberPad)
                    
                    Text("Engine Size (Liters): \(engineSize, specifier: "%.1f")L")
                    Slider(value: $engineSize, in: 1.0...8.0, step: 0.1)
                    
                }
            }
            .navigationTitle("Add New Car")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newCar = Car(
                            manufacturer: manufacturer,
                            model: model,
                            variant: variant,
                            year: year,
                            fuelType: fuelType,
                            engineSize: engineSize,
                            color: color,
                            horsepower: horsepower ?? 0,
                            price: price
                        )
                        onSave(newCar)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddCarView(onSave: { car in
        print("Saved new car: \(car.manufacturer) \(car.model)")
    })
}
