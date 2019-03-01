require "brainfsck/version"
require "brainfsck/vm"

module Brainfsck
  class Error < StandardError; end

  extend self

  def run(program)
    code =
      if File.file?(program)
        File.open(program, "r").read
      else
        program
      end

    Brainfsck::VM.new(code).run
  end
end
