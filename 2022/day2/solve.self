'../../../objects/everything.self' _RunScript.

"Today's theme: inline methods!"
(|
    parent* = std traits singleton.

    "Place input.txt in your cwd"
    input.

    "Hopefully one day we'll get a nice enum system."
    winState = (|
        win = (| parent* = std traits clonable |).
        draw = (| parent* = std traits clonable |).
        loss = (| parent* = std traits clonable |).
    |).

    part1 = (|
        winnerOf: him VS: you = (
            him = 'A' ifTrue: [
                you = 'X' ifTrue: [ ^ winState draw ].
                you = 'Y' ifTrue: [ ^ winState win ].
                you = 'Z' ifTrue: [ ^ winState loss ].
            ].
            him = 'B' ifTrue: [
                you = 'X' ifTrue: [ ^ winState loss ].
                you = 'Y' ifTrue: [ ^ winState draw ].
                you = 'Z' ifTrue: [ ^ winState win ].
            ].
            him = 'C' ifTrue: [
                you = 'X' ifTrue: [ ^ winState win ].
                you = 'Y' ifTrue: [ ^ winState loss ].
                you = 'Z' ifTrue: [ ^ winState draw ].
            ].
            _Error: 'Bruh'.
        ).

        bonusFor: state = (
            state == winState win ifTrue: [ ^ 6 ].
            state == winState draw ifTrue: [ ^ 3 ].
            state == winState loss ifTrue: [ ^ 0 ].
            _Error: 'Unknown state ', state.
        ).

        scoreFor: you = (
            you = 'X' ifTrue: [ ^ 1 ].
            you = 'Y' ifTrue: [ ^ 2 ].
            you = 'Z' ifTrue: [ ^ 3 ].
            _Error: 'oh nah m8'.
        ).

        total
    |
        total: 0.

        [| :break |
            input each: [| :line. him. you |
                line = '' ifTrue: break.

                line: line splitBy: ' '.
                him: line at: 0.
                you: line at: 1.

                total: total + (bonusFor: winnerOf: him VS: you) + (scoreFor: you).
            ].
        ] break.

        total
    ).

    part2 = (|
        "Rock = 1, Paper = 2, Scissors = 3"
        expectedScoreFor: him VS: you = (
            you = 'Z' ifTrue: [
                him = 'A' ifTrue: [ ^ 2 ].
                him = 'B' ifTrue: [ ^ 3 ].
                him = 'C' ifTrue: [ ^ 1 ].
            ].
            you = 'Y' ifTrue: [
                him = 'A' ifTrue: [ ^ 1 ].
                him = 'B' ifTrue: [ ^ 2 ].
                him = 'C' ifTrue: [ ^ 3 ].
            ].
            you = 'X' ifTrue: [
                him = 'A' ifTrue: [ ^ 3 ].
                him = 'B' ifTrue: [ ^ 1 ].
                him = 'C' ifTrue: [ ^ 2 ].
            ].
            _Error: 'Bruh'.
        ).

        scoreFor: you = (
            you = 'Z' ifTrue: [ ^ 6 ].
            you = 'Y' ifTrue: [ ^ 3 ].
            you = 'X' ifTrue: [ ^ 0 ].
            _Error: 'oh nah m8'.
        ).

        total.
    |
        total: 0.

        [| :break |
            input each: [| :line. him. you |
                line = '' ifTrue: break.

                line: line splitBy: ' '.
                him: line at: 0.
                you: line at: 1.

                total: total + (expectedScoreFor: him VS: you) + (scoreFor: you).
            ].
        ] break.

        total
    ).

    run = (
        input: (
            std file open: 'input.txt'
                ; readAll
                ; splitBy: '\n'
        ).

        part1 asString printLine.
        part2 asString printLine.
    )

|) run.
