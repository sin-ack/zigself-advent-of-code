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
                b: integerValues at: j.
                ((a + b) = 2020) ifTrue: [
                    ^ a * b.
                ].
            ].
        ].
    ).

    part2 = (| values. integerValues |
        values: input splitOn: ' '.
        integerValues: values copy.
        values do: [| :value. :i | integerValues at: i Put: value toInteger ].

        0 to: integerValues size prec Do: [| :i. a |
            a: integerValues at: i.
            i succ to: integerValues size Do: [| :j. b |
                b: integerValues at: j.
                j succ to: integerValues size Do: [| :k. c |
                    c: integerValues at: k.
                    ((a + b + c) = 2020) ifTrue: [
                        ^ a * b * c.
                    ].
                ].
            ].
        ].
    ).

    main = (
        'Part 1: ' print. part1 _StringPrint. '' printLine.
        'Part 2: ' print. part2 _StringPrint. '' printLine.
    ).
|) main.
