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
    var horsepower: Int
    var price: Double
}

struct ContentView: View {
    @State private var cars: [Car] = [
            Car(manufacturer: "Ferrari", model: "F8 Tributo", horsepower: 710, price: 276550),
            Car(manufacturer: "Lamborghini", model: "Huracan EVO", horsepower: 631, price: 261274),
            Car(manufacturer: "Porsche", model: "911 GT3", horsepower: 502, price: 161100)
        ]

    var body: some View {
            NavigationStack {
                List(cars) { car in
                    VStack(alignment: .leading) {
                        Text("\(car.manufacturer) \(car.model)")
                            .font(.headline)
                        Text("Horsepower: \(car.horsepower) hp")
                            .font(.subheadline)
                        Text("Price: $\(car.price, specifier: "%.2f")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .navigationTitle("Car Inventory")
            }
        }
}

#Preview {
    ContentView()
}
