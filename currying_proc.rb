class CurryingProc
  def initialize(*existing_args, &proc)
    @existing_args = existing_args
    @proc = proc
  end

  def call(*new_args)
    args = @existing_args + new_args
    if enough_args_to_call_proc?(args)
      @proc.call(*args)
    else
      self.class.new(*args, &@proc)
    end
  end

  alias_method :[], :call

  private

  def enough_args_to_call_proc?(args)
    args.length == @proc.arity
  end
end