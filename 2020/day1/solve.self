'../../../objects/everything.self' _RunScript.

(|
    parent* = self.

    "Should be a string with the numbers as space separated inputs."
    input = 'input.self' _RunScript.

    part1 = (| values. integerValues |
        values: input splitOn: ' '.
        integerValues: values copy.
        values do: [| :value. :i | integerValues at: i Put: value toInteger ].

        0 to: integerValues size prec Do: [| :i. a |
            a: integerValues at: i.
            i succ to: integerValues size Do: [| :j. b |
            "'i: ' print. i _StringPrint. ' j: ' print. j _StringPrint. '' printLine."
            b: integerValues at: j.
                ((a + b) = 2020) ifTrue: [
                    ^ a * b.
                ].
            ].
        ].
    ).

    part2 = 'TODO part 2'.

    main = (
        'Part 1: ' print. part1 _StringPrint. '' printLine.
        part2 printLine.
    ).
|) main.
