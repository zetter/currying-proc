require 'minitest'
require 'minitest/autorun'
require_relative 'currying_proc'


describe CurryingProc do
  subject { CurryingProc.new { 'hi' } }
  let(:two_arg_identity_proc) { CurryingProc.new {|x, y| [x,y]} }

  describe '.new' do
    it 'returns an instance of CurryingProc' do
      assert_kind_of CurryingProc, subject
    end
  end

  describe '#call' do
    describe 'with all the arguments' do
      it 'executes the block' do
        assert_equal [1,2], two_arg_identity_proc.call(1,2)
      end
    end

    describe 'with partial arguments' do
      it 'returns an instance of CurryingProc' do
        curried_proc = two_arg_identity_proc.call(1)
        assert_kind_of CurryingProc, curried_proc
      end

      it 'returns the curried version of the proc' do
        curried_proc = two_arg_identity_proc.call(1)
        assert_equal [1,2], curried_proc.call(2)
      end

      it 'returns a curried version that can be called multiple times' do
        curried_proc = two_arg_identity_proc.call(1)
        assert_equal [1,2], curried_proc.call(2)
        assert_equal [1,3], curried_proc.call(3)
      end

      it 'does not modify the original instance' do
        curried_proc = two_arg_identity_proc.call(1)
        assert_equal [3,4], two_arg_identity_proc.call(3,4)
      end
    end
  end

  describe '#[]' do
    it 'is aliased to call' do
      subject.method(:call) == subject.method(:[])
    end
  end
end