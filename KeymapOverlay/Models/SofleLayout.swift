import Foundation

enum SofleLayout {
    // ZMK binding positions 0-59 mapped to physical grid.
    // Matrix transform order (from sofled.dtsi):
    //   Rows 0-2: 12 keys each (left cols 0-5, right cols 6-11), positions 0-35
    //   Row 3:    12 regular keys + 2 encoder buttons, positions 36-49
    //             Left regular: 36-41, left encoder: 42, right encoder: 43, right regular: 44-49
    //   Row 4 (thumb): 10 keys (left 5, right 5), positions 50-59
    //
    // Visual grid uses:
    //   Rows 0-3 as main rows (6 regular cols + col 6 for inner encoder per half)
    //   Row 4 as thumb row
    //   Right half encoder sits at col 0; right regular keys shift to cols 1-6

    static let physicalKeys: [CornePhysicalKey] = [
        // Left row 0 (positions 0-5)
        CornePhysicalKey(0,  row: 0, col: 0, half: .left),
        CornePhysicalKey(1,  row: 0, col: 1, half: .left),
        CornePhysicalKey(2,  row: 0, col: 2, half: .left),
        CornePhysicalKey(3,  row: 0, col: 3, half: .left),
        CornePhysicalKey(4,  row: 0, col: 4, half: .left),
        CornePhysicalKey(5,  row: 0, col: 5, half: .left),
        // Right row 0 (positions 6-11)
        CornePhysicalKey(6,  row: 0, col: 0, half: .right),
        CornePhysicalKey(7,  row: 0, col: 1, half: .right),
        CornePhysicalKey(8,  row: 0, col: 2, half: .right),
        CornePhysicalKey(9,  row: 0, col: 3, half: .right),
        CornePhysicalKey(10, row: 0, col: 4, half: .right),
        CornePhysicalKey(11, row: 0, col: 5, half: .right),
        // Left row 1 (positions 12-17)
        CornePhysicalKey(12, row: 1, col: 0, half: .left),
        CornePhysicalKey(13, row: 1, col: 1, half: .left),
        CornePhysicalKey(14, row: 1, col: 2, half: .left),
        CornePhysicalKey(15, row: 1, col: 3, half: .left),
        CornePhysicalKey(16, row: 1, col: 4, half: .left),
        CornePhysicalKey(17, row: 1, col: 5, half: .left),
        // Right row 1 (positions 18-23)
        CornePhysicalKey(18, row: 1, col: 0, half: .right),
        CornePhysicalKey(19, row: 1, col: 1, half: .right),
        CornePhysicalKey(20, row: 1, col: 2, half: .right),
        CornePhysicalKey(21, row: 1, col: 3, half: .right),
        CornePhysicalKey(22, row: 1, col: 4, half: .right),
        CornePhysicalKey(23, row: 1, col: 5, half: .right),
        // Left row 2 (positions 24-29)
        CornePhysicalKey(24, row: 2, col: 0, half: .left),
        CornePhysicalKey(25, row: 2, col: 1, half: .left),
        CornePhysicalKey(26, row: 2, col: 2, half: .left),
        CornePhysicalKey(27, row: 2, col: 3, half: .left),
        CornePhysicalKey(28, row: 2, col: 4, half: .left),
        CornePhysicalKey(29, row: 2, col: 5, half: .left),
        // Right row 2 (positions 30-35)
        CornePhysicalKey(30, row: 2, col: 0, half: .right),
        CornePhysicalKey(31, row: 2, col: 1, half: .right),
        CornePhysicalKey(32, row: 2, col: 2, half: .right),
        CornePhysicalKey(33, row: 2, col: 3, half: .right),
        CornePhysicalKey(34, row: 2, col: 4, half: .right),
        CornePhysicalKey(35, row: 2, col: 5, half: .right),
        // Left row 3 regular (positions 36-41)
        CornePhysicalKey(36, row: 3, col: 0, half: .left),
        CornePhysicalKey(37, row: 3, col: 1, half: .left),
        CornePhysicalKey(38, row: 3, col: 2, half: .left),
        CornePhysicalKey(39, row: 3, col: 3, half: .left),
        CornePhysicalKey(40, row: 3, col: 4, half: .left),
        CornePhysicalKey(41, row: 3, col: 5, half: .left),
        // Left encoder button (position 42) — innermost of left row 3
        CornePhysicalKey(42, row: 3, col: 6, half: .left),
        // Right encoder button (position 43) — innermost of right row 3
        CornePhysicalKey(43, row: 3, col: 0, half: .right),
        // Right row 3 regular (positions 44-49) — shifted to cols 1-6
        CornePhysicalKey(44, row: 3, col: 1, half: .right),
        CornePhysicalKey(45, row: 3, col: 2, half: .right),
        CornePhysicalKey(46, row: 3, col: 3, half: .right),
        CornePhysicalKey(47, row: 3, col: 4, half: .right),
        CornePhysicalKey(48, row: 3, col: 5, half: .right),
        CornePhysicalKey(49, row: 3, col: 6, half: .right),
        // Left thumb (positions 50-54)
        CornePhysicalKey(50, row: 4, col: 0, half: .left),
        CornePhysicalKey(51, row: 4, col: 1, half: .left),
        CornePhysicalKey(52, row: 4, col: 2, half: .left),
        CornePhysicalKey(53, row: 4, col: 3, half: .left),
        CornePhysicalKey(54, row: 4, col: 4, half: .left),
        // Right thumb (positions 55-59)
        CornePhysicalKey(55, row: 4, col: 0, half: .right),
        CornePhysicalKey(56, row: 4, col: 1, half: .right),
        CornePhysicalKey(57, row: 4, col: 2, half: .right),
        CornePhysicalKey(58, row: 4, col: 3, half: .right),
        CornePhysicalKey(59, row: 4, col: 4, half: .right),
    ]

    static func keyDefinitions(from bindings: [LayerBinding], heldBindings: [Int: LayerBinding] = [:]) -> [KeyDefinition] {
        let bindingsByPosition = Dictionary(uniqueKeysWithValues: bindings.map { ($0.position, $0) })
        return physicalKeys.map { phys in
            if let held = heldBindings[phys.position] {
                return KeyDefinition(
                    row: phys.row, col: phys.col, half: phys.half,
                    label: held.displayLabel,
                    sfSymbols: held.displaySymbols,
                    type: held.keyType,
                    widthMultiplier: phys.widthMultiplier,
                    isHeld: true
                )
            }
            if let binding = bindingsByPosition[phys.position] {
                return KeyDefinition(
                    row: phys.row, col: phys.col, half: phys.half,
                    label: binding.displayLabel,
                    sfSymbols: binding.displaySymbols,
                    type: binding.keyType,
                    widthMultiplier: phys.widthMultiplier,
                    isCombo: binding.isCombo
                )
            }
            return KeyDefinition(
                row: phys.row, col: phys.col, half: phys.half,
                label: "", type: .blank, widthMultiplier: phys.widthMultiplier
            )
        }
    }

    static func mainRows(for half: KeyHalf, keys: [KeyDefinition]) -> [[KeyDefinition]] {
        (0...3).map { row in
            keys.filter { $0.half == half && $0.row == row }
                .sorted { $0.col < $1.col }
        }
    }

    static func thumbKeys(for half: KeyHalf, keys: [KeyDefinition]) -> [KeyDefinition] {
        keys.filter { $0.half == half && $0.row == 4 }
            .sorted { $0.col < $1.col }
    }

    static let defaultKeys: [KeyDefinition] = {
        var keys: [KeyDefinition] = []
        // Left row 0: Esc + number row
        let leftRow0: [(String, KeyType)] = [
            ("Esc", .modifier), ("1", .letter), ("2", .letter), ("3", .letter), ("4", .letter), ("5", .letter)
        ]
        for (col, (label, type)) in leftRow0.enumerated() {
            keys.append(KeyDefinition(row: 0, col: col, half: .left, label: label, type: type))
        }
        // Left row 1: Tab + QWERTY
        let leftRow1: [(String, KeyType)] = [
            ("Tab", .modifier), ("Q", .letter), ("W", .letter), ("E", .letter), ("R", .letter), ("T", .letter)
        ]
        for (col, (label, type)) in leftRow1.enumerated() {
            keys.append(KeyDefinition(row: 1, col: col, half: .left, label: label, type: type))
        }
        // Left row 2: Shift + home row
        let leftRow2: [(String, KeyType)] = [
            ("Shift", .modifier), ("A", .letter), ("S", .letter), ("D", .letter), ("F", .letter), ("G", .letter)
        ]
        for (col, (label, type)) in leftRow2.enumerated() {
            keys.append(KeyDefinition(row: 2, col: col, half: .left, label: label, type: type))
        }
        // Left row 3: Ctrl + bottom + encoder
        let leftRow3: [(String, KeyType)] = [
            ("Ctrl", .modifier), ("Z", .letter), ("X", .letter), ("C", .letter), ("V", .letter), ("B", .letter),
            ("ENC", .modifier)
        ]
        for (col, (label, type)) in leftRow3.enumerated() {
            keys.append(KeyDefinition(row: 3, col: col, half: .left, label: label, type: type))
        }
        // Left thumb
        let leftThumb: [(String, KeyType)] = [
            ("Mo9", .layer), ("Alt", .modifier), ("Cmd", .modifier), ("Lwr", .layer), ("Ent", .modifier)
        ]
        for (col, (label, type)) in leftThumb.enumerated() {
            keys.append(KeyDefinition(row: 4, col: col, half: .left, label: label, type: type))
        }
        // Right row 0: number row + backslash
        let rightRow0: [(String, KeyType)] = [
            ("6", .letter), ("7", .letter), ("8", .letter), ("9", .letter), ("0", .letter), ("\\", .symbol)
        ]
        for (col, (label, type)) in rightRow0.enumerated() {
            keys.append(KeyDefinition(row: 0, col: col, half: .right, label: label, type: type))
        }
        // Right row 1: QWERTY + Bksp
        let rightRow1: [(String, KeyType)] = [
            ("Y", .letter), ("U", .letter), ("I", .letter), ("O", .letter), ("P", .letter), ("Bksp", .modifier)
        ]
        for (col, (label, type)) in rightRow1.enumerated() {
            keys.append(KeyDefinition(row: 1, col: col, half: .right, label: label, type: type))
        }
        // Right row 2: home row + quote
        let rightRow2: [(String, KeyType)] = [
            ("H", .letter), ("J", .letter), ("K", .letter), ("L", .letter), (";", .symbol), ("'", .symbol)
        ]
        for (col, (label, type)) in rightRow2.enumerated() {
            keys.append(KeyDefinition(row: 2, col: col, half: .right, label: label, type: type))
        }
        // Right row 3: encoder + bottom + CapsLk (cols 0-6)
        let rightRow3: [(String, KeyType)] = [
            ("ENC", .modifier),
            ("N", .letter), ("M", .letter), (",", .symbol), (".", .symbol), ("/", .symbol), ("Caps", .modifier)
        ]
        for (col, (label, type)) in rightRow3.enumerated() {
            keys.append(KeyDefinition(row: 3, col: col, half: .right, label: label, type: type))
        }
        // Right thumb
        let rightThumb: [(String, KeyType)] = [
            ("Spc", .letter), ("Rse", .layer), ("Mo3", .layer), ("⌥⌫", .modifier), ("⌥⌦", .modifier)
        ]
        for (col, (label, type)) in rightThumb.enumerated() {
            keys.append(KeyDefinition(row: 4, col: col, half: .right, label: label, type: type))
        }
        return keys
    }()
}
