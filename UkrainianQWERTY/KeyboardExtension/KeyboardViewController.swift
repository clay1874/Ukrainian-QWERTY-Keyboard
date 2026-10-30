import UIKit

final class KeyboardViewController: UIInputViewController {
    private let rows: [[String]] = [
        ["й","ц","у","к","е","н","г","ш","щ","з","х","ї"],
        ["ф","і","в","а","п","р","о","л","д","ж","є"],
        ["я","ч","с","м","и","т","ь","б","ю"]
    ]

    private let keyboard = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        keyboard.axis = .vertical
        keyboard.spacing = 8
        keyboard.distribution = .fillEqually
        keyboard.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyboard)

        NSLayoutConstraint.activate([
            keyboard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            keyboard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            keyboard.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            keyboard.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])

        for (index, row) in rows.enumerated() {
            let stack = makeRow(row)
            keyboard.addArrangedSubview(stack)
            if index == 2 {
                let controls = makeRow(["⇧"] + row + ["⌫"])
                keyboard.removeArrangedSubview(stack)
                stack.removeFromSuperview()
                keyboard.addArrangedSubview(controls)
            }
        }

        let bottom = makeRow(["123", ",", "🌐", "space", ".", "return"])
        keyboard.addArrangedSubview(bottom)
    }

    private func makeRow(_ titles: [String]) -> UIStackView {
        let row = UIStackView()
        row.axis = .horizontal
        row.spacing = 4
        row.distribution = .fillEqually
        for title in titles {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: title == "space" ? 14 : 18)
            button.backgroundColor = .secondarySystemBackground
            button.layer.cornerRadius = 5
            button.addTarget(self, action: #selector(keyPressed(_:)), for: .touchUpInside)
            row.addArrangedSubview(button)
        }
        return row
    }

    @objc private func keyPressed(_ sender: UIButton) {
        guard let key = sender.currentTitle else { return }
        switch key {
        case "space": textDocumentProxy.insertText(" ")
        case "return": textDocumentProxy.insertText("\n")
        case "⌫": textDocumentProxy.deleteBackward()
        case "🌐": advanceToNextInputMode()
        case "⇧", "123": break // Shift and numeric/symbol layer are placeholders in this starter.
        default: textDocumentProxy.insertText(key)
        }
    }
}
