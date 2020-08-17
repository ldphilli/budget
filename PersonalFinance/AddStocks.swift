//
//  AddStocks.swift
//  PersonalFinance
//
//  Created by Luke Phillips on 07/08/2020.
//  Copyright © 2020 Luke Phillips. All rights reserved.
//

import SwiftUI

struct AddStocks: View {
    @Binding var text: String
    
    @State private var isEditing = false
    
    @State var food = ["Spaghetti", "Cheese Burger", "Pizza", "Fried Rice"]
    
    var stocks = [StockResponse]()
    
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
                    if isEditing {
                        Button(action: {
                            self.text = ""
                        }) {
                            Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
            List(food, id: \.self) { data in
                Text(data)
            }
            .listStyle(GroupedListStyle())
        }
    }

    struct AddStocks_Previews: PreviewProvider {
        static var previews: some View {
            AddStocks(text: .constant(""))
        }
    }
    
    /*func GetAllStocks() -> [StockResponse] {
        // Create URL
        let url = URL(string: "https://prod-25.uksouth.logic.azure.com:443/workflows/26dc8f4f5b044486b86cb78877a2fe57/triggers/manual/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=zzcO4jqeTjPfpBacPn-6kC5hiubJel7qqsclN02ai60")
        guard let requestUrl = url else { fatalError() }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        
        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            guard let data = data else { return }
            // Using parseJSON() function to convert data to Swift struct
            let stockItem = parseJSON(data: data)
                
            // Read todo item title
            guard let stockItemModel = stockItem else { return }
            print("Todo item title = \(stockItemModel.name)")
            
        }

        task.resume()
        
        //return
    }*/
    
    struct StockResponse: Codable {
        let stockID: Int
        let name: Int
        let tickerSymbol: String
    }
    
    func parseJSON(data: Data) -> StockResponse? {
        
        var stock: StockResponse?
        do {
            stock = try JSONDecoder().decode(StockResponse.self, from: data)
        } catch {
            print("Error took place\(error.localizedDescription).")
        }
        
        return stock
    }
}
