//
//  SplitViewController.swift
//  minimal-appkit-starter
//
//  Created by qiyang on 2026/8/23.
//

import Cocoa

final class SplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let sidebar = NSSplitViewItem(sidebarWithViewController: SidebarViewController())
        let detail = NSSplitViewItem(viewController: DetailViewController())

        addSplitViewItem(sidebar)
        addSplitViewItem(detail)
    }
}

// MARK: - Sidebar (source list)

final class SidebarViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    private let items = ["Item 1", "Item 2", "Item 3"]
    private let tableView = NSTableView()

    override func loadView() {
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("SidebarColumn"))
        tableView.addTableColumn(column)
        tableView.headerView = nil
        tableView.style = .sourceList
        tableView.rowSizeStyle = .default
        tableView.dataSource = self
        tableView.delegate = self

        let scrollView = NSScrollView()
        scrollView.documentView = tableView
        scrollView.hasVerticalScroller = true

        view = scrollView
    }

    func numberOfRows(in tableView: NSTableView) -> Int {
        items.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let identifier = NSUserInterfaceItemIdentifier("SidebarCell")
        let cell = tableView.makeView(withIdentifier: identifier, owner: self) as? NSTableCellView
            ?? makeCell(identifier: identifier)
        cell.textField?.stringValue = items[row]
        return cell
    }

    private func makeCell(identifier: NSUserInterfaceItemIdentifier) -> NSTableCellView {
        let cell = NSTableCellView()
        cell.identifier = identifier

        let label = NSTextField(labelWithString: "")
        label.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(label)
        cell.textField = label

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 2),
            label.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
        ])
        return cell
    }
}

// MARK: - Detail

final class DetailViewController: NSViewController {

    override func loadView() {
        let label = NSTextField(labelWithString: "Detail")
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        let view = NSView()
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        self.view = view
    }
}