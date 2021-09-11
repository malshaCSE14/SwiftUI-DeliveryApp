//
//  AddressView.swift
//  DeliveryAppTest
//
//  Created by Malsha Hansini on 11/09/2021.
//

import SwiftUI
import MapKit
import Combine

class MapSearch : NSObject, ObservableObject {
    @Published var locationResults : [MKLocalSearchCompletion] = []
    @Published var searchTerm = ""
    
    private var cancellables : Set<AnyCancellable> = []
    
    private var searchCompleter = MKLocalSearchCompleter()
    private var currentPromise : ((Result<[MKLocalSearchCompletion], Error>) -> Void)?
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        
        $searchTerm
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap({ (currentSearchTerm) in
                self.searchTermToResults(searchTerm: currentSearchTerm)
            })
            .sink(receiveCompletion: { (completion) in
                //handle error
            }, receiveValue: { (results) in
                self.locationResults = results
            })
            .store(in: &cancellables)
    }
    
    func searchTermToResults(searchTerm: String) -> Future<[MKLocalSearchCompletion], Error> {
        Future { promise in
            self.searchCompleter.queryFragment = searchTerm
            self.currentPromise = promise
        }
    }
}

extension MapSearch : MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
            currentPromise?(.success(completer.results))
        }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        //could deal with the error here, but beware that it will finish the Combine publisher stream
        //currentPromise?(.failure(error))
    }
}

struct AddressView: View {
    @StateObject private var mapSearch = MapSearch()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Address", text: $mapSearch.searchTerm)
                }
                Section {
                    ForEach(mapSearch.locationResults, id: \.self) { location in
                        NavigationLink(destination: Detail(locationResult: location, paymentMethod: 1)) {
                            VStack(alignment: .leading) {
                                Text(location.title)
                                Text(location.subtitle)
                                    .font(.system(.caption))
                            }
                        }
                    }
                }
            }.navigationTitle(Text("Delivery Address"))
        }
    }
}

class DetailViewModel : ObservableObject {
    @Published var isLoading = true
    @Published private var coordinate : CLLocationCoordinate2D?
    @Published var region: MKCoordinateRegion = MKCoordinateRegion()
    
    var coordinateForMap : CLLocationCoordinate2D {
        coordinate ?? CLLocationCoordinate2D()
    }
    
    func reconcileLocation(location: MKLocalSearchCompletion) {
        let searchRequest = MKLocalSearch.Request(completion: location)
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            if error == nil, let coordinate = response?.mapItems.first?.placemark.coordinate {
                self.coordinate = coordinate
                self.region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
                self.isLoading = false
            }
        }
    }
    
    func clear() {
        isLoading = true
    }
}

struct Detail : View {
    var locationResult : MKLocalSearchCompletion
    @StateObject private var viewModel = DetailViewModel()
    @State var paymentMethod: Int
    @State var presentingModal = false

    struct Marker: Identifiable {
        let id = UUID()
        var location: MapMarker
    }
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                Text("Loading...")
            } else {
                VStack(alignment: .leading) {
                    Map(coordinateRegion: $viewModel.region,
                        annotationItems: [Marker(location: MapMarker(coordinate: viewModel.coordinateForMap))]) { (marker) in
                        marker.location
                    }
                    Text("Delivery Address:").font(.title3).fontWeight(.semibold).padding([.leading, .top])
                    VStack(alignment: .leading) {
                        Text(locationResult.title).fixedSize(horizontal: false, vertical: true)
                        Text(locationResult.subtitle).fixedSize(horizontal: false, vertical: true).foregroundColor(.secondary)
                        HStack {
                          Spacer()
                        }
                    }.padding([.top, .leading])
                    .padding(.bottom, 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("shadowGray"), lineWidth: 1)
                    ).padding([.leading, .trailing], 20)
                    Text("Payment Method:").font(.title3).fontWeight(.semibold).padding([.leading, .top])
                    
                    Button(action: {
                        self.presentingModal = true
                        paymentMethod = 0
                    }) {
                        Text("Add Card").fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        if paymentMethod == 0 {
                            Image(systemName:"checkmark").foregroundColor(.green)
                                .font(.title2)
                        }
                    }.sheet(isPresented: $presentingModal) { AddCardView() }
                    .padding()
                    .background(Color("lightGray"))
                    .cornerRadius(8)
                    .padding([.leading, .trailing])
                    Button(action: {
                        paymentMethod = 1
                    }) {
                        Text("Cash On Delivery").fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        if paymentMethod == 1 {
                            Image(systemName:"checkmark").foregroundColor(.green)
                                .font(.title2)
                        }
                    }.padding()
                    .background(Color("lightGray"))
                    .cornerRadius(8)
                    .padding([.leading, .trailing])
                }
            }
            NavigationLink(destination: OrderSuccessView()) {
                HStack {
                    Text("Proceed")
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding(.leading)
                    Spacer()
                    Image(systemName: "cart")
                        .font(.title)
                        .padding(.trailing)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(40)
            }.padding(20)
        }.onAppear {
            viewModel.reconcileLocation(location: locationResult)
        }.onDisappear {
            viewModel.clear()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
