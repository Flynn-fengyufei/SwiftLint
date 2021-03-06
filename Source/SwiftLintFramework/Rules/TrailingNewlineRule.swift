//
//  TrailingNewlineRule.swift
//  SwiftLint
//
//  Created by JP Simard on 2015-05-16.
//  Copyright (c) 2015 Realm. All rights reserved.
//

import SourceKittenFramework

struct TrailingNewlineRule: Rule {
    static let identifier = "trailing_newline"
    static let parameters = [RuleParameter<Void>]()

    static func validateFile(file: File) -> [StyleViolation] {
        let countOfTrailingNewlines = file.contents.countOfTailingCharactersInSet(
            NSCharacterSet.newlineCharacterSet()
        )
        if countOfTrailingNewlines != 1 {
            return [StyleViolation(type: .TrailingNewline,
                location: Location(file: file.path),
                severity: .Medium,
                reason: "File should have a single trailing newline: " +
                "currently has \(countOfTrailingNewlines)")]
        }
        return []
    }
}
