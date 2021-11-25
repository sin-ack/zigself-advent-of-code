Advent of Code Challenges in zigSelf
---

These are used to test the language's capabilities and fix bugs.

## Requirements

You need zigSelf.

## How to Run

The files expect to be executed in a directory within the main zigSelf repo, so
that they can reach the standard library.

```console
# In the zigSelf repository root
$ git clone https://github.com/sin-ack/zigself-advent-of-code aoc
# Provide your puzzle input for the day. The solve.self file will tell you
# how the input should be formatted.
$ $EDITOR aoc/2020/day1/input.self
# Solve the challenge
$ zig build run -- aoc/2020/day1/solve.self
```

## License

All the code in this repository is licensed under the 2-Clause BSD License. See
[LICENSE](LICENSE) for more details.
