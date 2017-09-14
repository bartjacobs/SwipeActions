//
//  ViewController.swift
//  Swiping
//
//  Created by Bart Jacobs on 09/09/2017.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Segue {

        static let Detail = "Detail"

    }

    // MARK: - Properties

    @IBOutlet var tableView: UITableView!

    // MARK: -

    private let data = [
        "One",
        "Two",
        "Three"
    ]

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup View
        setupView()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }

        switch identifier {
        case Segue.Detail:
            guard let destination = segue.destination as? DetailViewController else {
                fatalError()
            }

            if let indexPath = sender as? IndexPath {
                destination.details = data[indexPath.row]
            }
        default: break
        }
    }

    // MARK: - View Methods

    fileprivate func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    fileprivate func updateView() {

    }

}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue Reusable Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)

        // Configure Cell
        cell.textLabel?.text = data[indexPath.row]

        return cell
    }

}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let markAsReadAction = UIContextualAction(style: .normal, title: "Mark As Read") { (action, view, completion) in
            self.performSegue(withIdentifier: Segue.Detail, sender: indexPath)
        }

        markAsReadAction.backgroundColor = .blue

        let configuration = UISwipeActionsConfiguration(actions: [markAsReadAction])
        configuration.performsFirstActionWithFullSwipe = true

        return configuration
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { [unowned self] (action, view, completion) in
            self.performSegue(withIdentifier: Segue.Detail, sender: indexPath)
        }

        deleteAction.backgroundColor = .red

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true

        return configuration
    }

}
