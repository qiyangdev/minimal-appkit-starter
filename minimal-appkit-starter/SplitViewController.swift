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

        addSplitViewItem(NSSplitViewItem(sidebarWithViewController:
            ListViewController(items: ["All", "Favorites", "Trash"], style: .sourceList)))

        let middle = NSSplitViewItem(viewController:
            ListViewController(items: ["Message 1", "Message 2", "Message 3", "Message 4", "Message 5"],
                               columnTitle: "Messages",
                               style: .inset))
        middle.minimumThickness = 220
        middle.preferredThicknessFraction = 0.35
        addSplitViewItem(middle)

        let detail = NSSplitViewItem(viewController: DetailViewController())
        detail.minimumThickness = 260
        addSplitViewItem(detail)
    }
}

// MARK: - List column

final class ListViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    private let items: [String]
    private let style: NSTableView.Style
    private let tableView = NSTableView()

    init(items: [String], columnTitle: String? = nil, style: NSTableView.Style) {
        self.items = items
        self.style = style
        super.init(nibName: nil, bundle: nil)

        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("Column"))
        column.title = columnTitle ?? ""
        tableView.addTableColumn(column)
        tableView.headerView = columnTitle == nil ? nil : NSTableHeaderView()
        tableView.style = style
        tableView.rowSizeStyle = .default
        tableView.dataSource = self
        tableView.delegate = self

        let scrollView = NSScrollView()
        scrollView.documentView = tableView
        scrollView.hasVerticalScroller = true
        view = scrollView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfRows(in tableView: NSTableView) -> Int {
        items.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let identifier = NSUserInterfaceItemIdentifier("Cell")
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