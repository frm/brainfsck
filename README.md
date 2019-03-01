# Brainfsck

Just a [brainf\*ck](https://esolangs.org/wiki/brainfuck) interpreter.

## Installation

    $ gem install brainfsck

## Usage

    $ brainfsck "+>++>+++."
    1
    2
    3

You can also see how your code is getting interpreted by setting the `DEBUG` env
variable:

    $ DEBUG=1 brainfsck "+>++>+++."
    ip: 0
    dp: 0
    ff: 0
    mem: [0]
    call_stack: []
    program: +>++>+++.
             ^
    ==================
    ip: 1
    dp: 0
    ff: 0
    mem: [1]
    call_stack: []
    program: +>++>+++.
              ^
    ==================
    ip: 2
    dp: 1
    ff: 0
    mem: [1, 0]
    call_stack: []
    program: +>++>+++.
               ^
    ==================
    ip: 3
    dp: 1
    ff: 0
    mem: [1, 1]
    call_stack: []
    program: +>++>+++.
                ^
    ==================
    ip: 4
    dp: 1
    ff: 0
    mem: [1, 2]
    call_stack: []
    program: +>++>+++.
                 ^
    ==================
    ip: 5
    dp: 2
    ff: 0
    mem: [1, 2, 0]
    call_stack: []
    program: +>++>+++.
                  ^
    ==================
    ip: 6
    dp: 2
    ff: 0
    mem: [1, 2, 1]
    call_stack: []
    program: +>++>+++.
                   ^
    ==================
    ip: 7
    dp: 2
    ff: 0
    mem: [1, 2, 2]
    call_stack: []
    program: +>++>+++.
                    ^
    ==================
    ip: 8
    dp: 2
    ff: 0
    mem: [1, 2, 3]
    call_stack: []
    program: +>++>+++.
                     ^
    1
    2
    3
    ==================

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/justmendes/brainfsck. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Brainfsck project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/justmendes/brainfsck/blob/master/CODE_OF_CONDUCT.md).
