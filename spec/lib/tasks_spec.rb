require 'spec_helper'
require 'tasks'

describe '#fact' do
  class Integer
    prepend Factorial
  end
  subject { num.fact }
  context '0のとき' do
    let(:num) { 0 }
    it { is_expected.to eq(1) }
  end
  context '負の数のとき' do
    let(:num) { -1 }
    it 'エラーを返す' do
      expect { subject }.to raise_error(RangeError)
    end
  end
  context '正の数のとき' do
    let(:num) { 4 }
    it { is_expected.to eq(24) }
  end
end

describe '#my_include?' do
  class Array
    prepend MyInclude
  end
  subject { ary.my_include?(elm) }
  let(:ary) { [1, '2', nil]}
  context '含むとき' do
    let(:elm) { 1 }
    it { is_expected.to eq(true) }
  end
  context '含まないとき' do
    let(:elm) { 2 }
    it { is_expected.to eq(false) }
  end
end

describe '#my_concat' do
  class Array
    prepend MyConcat
  end
  subject { ary.my_concat(another) }
  let(:ary) { [1, '2', nil] }
  let(:another) { [3, '4', :five] }
  it { is_expected.to eq(ary + another) }
end

describe '#my_fetch' do
  class Array
    prepend MyFetch
  end
  subject { ary.my_fetch(index) }
  let(:ary) { [1, '2', nil] }
  let(:index) { 1 }
  it { is_expected.to eq(ary[index]) }
end

describe '#my_quicksort' do
  class Array
    prepend MyQuickSort1
  end
  subject { ary.my_quicksort }
  let(:ary) { [1, 7, 2, 4, 10] }
  it { is_expected.to eq(ary.sort) }
  it "非破壊的である" do
    original = ary.clone
    ary.my_quicksort
    expect(ary).to eq(original)
  end
end

describe '#my_quicksort2' do
  class Array
    prepend MyQuickSort2
  end
  subject { ary.my_quicksort2 }
  let(:ary) { [1, 7, 2, 4, 10] }
  it { is_expected.to eq(ary.sort) }
  it "非破壊的である" do
    cloned = ary.clone
    ary.my_quicksort2
    expect(ary).to eq(cloned)
  end
end