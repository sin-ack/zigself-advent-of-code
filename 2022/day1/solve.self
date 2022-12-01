'../../../objects/everything.self' _RunScript.

(|
    parent* = std traits singleton.

    "Put input.txt in your cwd"
    input.

    eachSum: block = (
        input splitBy: '\n\n'; each: [| :group. sum |
            sum: 0.
            [| :break |
                group splitBy: '\n'; each: [| :item |
                    item = '' ifTrue: break.
                    sum: sum + item asInteger.
                ].
            ] break.

            block value: sum.
        ].
    ).

    part1 = (| maxCalories. |
        maxCalories: 0.

        eachSum: [| :sum |
            sum > maxCalories ifTrue: [ maxCalories: sum ].
        ].

        maxCalories.
    ).

    part2 = (| calorieTotals. |
        calorieTotals: std vector copyRemoveAll.

        eachSum: [| :sum |
            calorieTotals add: sum.
        ].

        calorieTotals sort.
        calorieTotals reverse.
        calorieTotals copyFrom: 0 To: 3; fold: [| :acc. :item | acc + item] Initial: 0.
    ).

    run = (
        input: (std file open: 'input.txt'; readAll).
        part1 asString printLine.
        part2 asString printLine.
    ).
|) run.
