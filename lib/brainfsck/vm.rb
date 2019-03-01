require "io/console"

module Brainfsck
  class VM
    MEM_SIZE = 1_024_000
    DEBUGGING = ENV["DEBUG"] == "1"

    def initialize(program)
      @dp = 0
      @ip = 0
      @mem = Array.new(MEM_SIZE, 0)
      @call_stack = []
      @program = program
      @ff = 0
    end

    def run
      while ip < program.length
        run_instruction(program[ip])
        @ip += 1
      end
    end

    private

    attr_reader :dp, :ip, :mem, :call_stack, :program, :ff

    def run_instruction(instruction)
      with_debug do
        return noop_with_debug if ff > 0 && instruction != "]"

        y_lambda = {
          ">" => inc_dp,
          "<" => dec_dp,
          "+" => inc_byte,
          "-" => dec_byte,
          "." => p_buf,
          "," => rw_byte,
          "[" => opn_while,
          "]" => cls_while,
        }[instruction] || noop

        y_lambda.call
      end
    end

    def debugging?
      DEBUGGING
    end

    # Complex VM OPS - intentionally poorly named

    def opn_while
      -> do
        if mem[dp].zero?
          @ff += 1
        elsif @call_stack.last != ip
          @call_stack.push(ip)
        end
      end
    end

    def cls_while
      -> do
        if ff.zero?
          @ip = call_stack.last - 1
        else
          @ff -= 1
          @call_stack.pop
        end
      end
    end

    def noop_with_debug
      puts "noop-ing instruction" if debugging?

      noop.call
    end

    # Simple VM OPS - intentionally poorly named

    def noop
      -> {  }
    end

    def inc_dp
      -> { @dp = [@dp + 1, MEM_SIZE - 1].min }
    end

    def dec_dp
      -> { @dp = [@dp - 1, 0].max }
    end

    def inc_byte
      -> { @mem[dp] += 1 }
    end

    def dec_byte
      -> { @mem[dp] -= 1 }
    end

    def p_buf
      -> { puts @mem[0..dp] }
    end

    def rw_byte
      -> { @mem[dp] = STDIN.getch }
    end

    # Debug only

    def with_debug
      print_program_data if debugging?

      yield

      if debugging?
        separator = "=" * (program.length + 9)
        puts "#{separator}\n"
      end
    end

    def print_program_data
      puts "ip: #{ip}"
      puts "dp: #{dp}"
      puts "ff: #{ff}"
      puts "mem: #{mem[0..dp]}"
      puts "call_stack: #{call_stack}"
      puts "program: #{program}"
      puts " " * (9 + ip) + "^"
    end
  end
end
