//
//  ContentView.swift
//  Car Dealership CRUD
//
//  Created by Andrei Aldea on 16.10.2025.
//

import SwiftUI

struct Car: Identifiable {
    let id = UUID()
    var manufacturer: String
    var model: String
    var variant: String
    var generation: String
    var year: Int
    var fuelType: String
    var engineSize: Double
    var color: String
    var horsepower: Int
    var price: Double
}

struct ContentView: View {
    @State private var cars: [Car] = [
        Car(manufacturer: "BMW", model: "3 Series", variant: "340d", generation: "G20", year: 2021, fuelType: "Diesel", engineSize: 3.0, color: "Gray", horsepower: 340, price: 75000)
        ]
    
    @State private var isPresentingAddCarView = false

    var body: some View {
            NavigationStack {
                List(cars) { car in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(String(car.year)) \(car.manufacturer) \(car.model) \(car.variant)")
                            .font(.headline)

                        Text("\(car.horsepower) hp | \(String(format: "%.1f", car.engineSize))L \(car.fuelType)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("$\(car.price, specifier: "%.2f")")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                    }
                    .padding(.vertical, 5)
                }
                .navigationTitle("Car Inventory")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add") {
                            isPresentingAddCarView = true
                        }
                    }
                }
                .sheet(isPresented: $isPresentingAddCarView) {
                    Text("This is where we will add a new car.")
                }
            }
        }
}

#Preview {
    ContentView()
}
