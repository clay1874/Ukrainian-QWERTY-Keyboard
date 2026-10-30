import UIKit

final class KeyboardViewController: UIInputViewController {
    private let rows = [
        ["й", "ц", "у", "к", "е", "н", "г", "ш", "щ", "з"],
        ["ф", "і", "в", "а", "п", "р", "о", "л", "д", "ж", "є"],
        ["я", "ч", "с", "м", "и", "т", "ь", "б", "ю", "ї"]
    ]
    private var isUppercase = false
    private var isNumbers = false
    private var keyboardHeight: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.82, alpha: 1)
        buildKeyboard()
    }

    private func buildKeyboard() {
        view.subviews.forEach { $0.removeFromSuperview() }
        let root = UIStackView()
        root.axis = .vertical
        root.spacing = 8
        root.distribution = .fillEqually
        root.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(root)
        NSLayoutConstraint.activate([
            root.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            root.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            root.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            root.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])

        if isNumbers {
            addRow(["1","2","3","4","5","6","7","8","9","0"], to: root)
            addRow(["@","#","$","&","-","+","(",")","/","*"], to: root)
            addRow(["=","%","!","?",":",";", "'", "\"", "⌫"], to: root)
        } else {
            for (index, row) in rows.enumerated() {
                var keys = row
                if index == 2 { keys = ["⇧"] + row + ["⌫"] }
                addRow(keys, to: root)
            }
        }

        let bottom = UIStackView()
        bottom.axis = .horizontal
        bottom.spacing = 5
        bottom.distribution = .fillProportionally
        root.addArrangedSubview(bottom)
        addButton("123", to: bottom, action: #selector(toggleNumbers), width: 48)
        addButton("🌐", to: bottom, action: #selector(nextKeyboard), width: 42)
        addButton(",", to: bottom, action: #selector(insertComma), width: 34)
        addButton("Пробіл", to: bottom, action: #selector(insertSpace), width: nil)
        addButton(".", to: bottom, action: #selector(insertPeriod), width: 34)
        addButton("↵", to: bottom, action: #selector(insertNewline), width: 44)
        keyboardHeight?.isActive = false
        keyboardHeight = view.heightAnchor.constraint(equalToConstant: 258)
        keyboardHeight?.priority = .defaultHigh
        keyboardHeight?.isActive = true
    }

    private func addRow(_ keys: [String], to stack: UIStackView) {
        let row = UIStackView()
        row.axis = .horizontal
        row.spacing = 4
        row.distribution = .fillEqually
        stack.addArrangedSubview(row)
        for key in keys {
            let action: Selector
            switch key {
            case "⇧": action = #selector(toggleShift)
            case "⌫": action = #selector(deleteBackward)
            default: action = #selector(insertKey(_:))
            }
            addButton(key, to: row, action: action, width: nil)
        }
    }

    private func addButton(_ title: String, to stack: UIStackView, action: Selector, width: CGFloat?) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: title == "Пробіл" ? 14 : 20)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.addTarget(self, action: action, for: .touchUpInside)
        stack.addArrangedSubview(button)
        if let width { button.widthAnchor.constraint(equalToConstant: width).isActive = true }
    }

    @objc private func insertKey(_ sender: UIButton) {
        guard let key = sender.title(for: .normal) else { return }
        textDocumentProxy.insertText(isUppercase ? key.uppercased() : key)
        if isUppercase { isUppercase = false; buildKeyboard() }
    }
    @objc private func toggleShift() { isUppercase.toggle(); buildKeyboard() }
    @objc private func deleteBackward() { textDocumentProxy.deleteBackward() }
    @objc private func insertSpace() { textDocumentProxy.insertText(" ") }
    @objc private func insertComma() { textDocumentProxy.insertText(",") }
    @objc private func insertPeriod() { textDocumentProxy.insertText(".") }
    @objc private func insertNewline() { textDocumentProxy.insertText("\n") }
    @objc private func toggleNumbers() { isNumbers.toggle(); buildKeyboard() }
    @objc private func nextKeyboard() { advanceToNextInputMode() }
}
