class CurryingProc
  def initialize(*args, &block)
    @args = args
    @block = block
  end

  def call(*new_args)
    args = @args + new_args
    if args.length == @block.arity
      @block.call(*args)
    else
      self.class.new(*args, &@block)
    end
  end

  alias_method :[], :call
end