require 'spec_helper'
require 'tasks'

describe '#fact' do
  context '0のとき' do
    it '1を返す' do
      expect(fact(0)).to eq(1)
    end
  end
  context '負の数のとき' do
    it 'エラーを返す' do
      expect { fact(-1) }.to raise_error(ArgumentError)
    end
  end
  context '正の数のとき' do
    it '整数を返す' do
      expect(fact(4)).to eq(24)
    end
  end
end

describe '#my_include?' do
  let(:ary) { [1, '2', nil]}
  context '含むとき' do
    it 'trueを返す' do
      expect(ary.my_include?(1)).to eq(true)
    end
  end
  context '含まないとき' do
    it 'trueを返す' do
      expect(ary.my_include?(2)).to eq(false)
    end
  end
end

describe '#my_concat' do
  let(:ary) { [1, '2', nil] }
  let(:another) { [3, '4', :five] }
  it '順番を保持する' do
    expect(ary.my_concat(another)).to eq(ary + another)
  end
end

describe '#my_fetch' do
  let(:ary) { [1, '2', nil] }
  it 'インデックスに相当する要素を返す' do
    expect(ary.my_fetch(1)).to eq(ary[1])
  end
end