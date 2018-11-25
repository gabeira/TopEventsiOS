//
//  ViewController.swift
//  TopEvents
//
//  Created by Gabriel Bernardo Pereira on 21/11/18.
//  Copyright © 2018 Gabriel Bernardo Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoadEventsDelegate {

    @IBOutlet weak var tableView: UITableView!
    var events: [Event] = []

    var eventsRequest: EventsRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = Bundle.main.infoDictionary!["CFBundleName"] as? String
        tableView.delegate = self
        tableView.dataSource = self
        eventsRequest = EventsRequest()
        eventsRequest?.delegate = self
        eventsRequest?.loadEventsFromServer()
    }

    func didFinishLoadingEvents(_ sender: Events) {
        self.events = sender.events
            .filter({return $0.availableSeats > 0})
            .sorted(by: { return $0.date < $1.date })

        self.printEventsToTerminal(events: self.events)
        self.tableView.reloadData()
    }
    
    func didFinishLoadingWithError(_ error: String) {
        print(error)
    }
    
    fileprivate func printEventsToTerminal(events: [Event]){
        events.forEach({ (e: Event) in
            print("Event \(e.name), cost $\(e.price) at the \(e.venue).")
        })
        print("\n")
        events.forEach({ (e: Event) in
            if (e.labels.contains("play")){
                print("Playing Event \(e.name), cost $\(e.price) at the \(e.venue).")
            }
        })
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = self.events[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventTableViewCell", for: indexPath) as! EventViewCell
        cell.setEvent(event: event)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = self.events[indexPath.row]
        let alertTitle = "Event \(event.name)"
        let alertMessage = "Still have \(event.availableSeats) available seats\nLocation \(event.venue)\nIt cost $\(event.price)."
        
        let alertViewController:UIAlertController = Utilities.showAlertViewController(title: alertTitle, message: alertMessage)
        self.present(alertViewController, animated: true, completion: nil)
        
        //Deselect the selected row
        if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
        }
    }
}
