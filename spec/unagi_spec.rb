require './unagi.rb'

describe Unagi do
  describe '#initialize' do
    it '初期化すると 引数で指定したサイズの配列が 0 で初期化された状態で作成される' do
      unagi = Unagi.new(3)
      expect(unagi.seats).to eq [0, 0, 0]
    end
  end

  describe '#seating' do
    let(:unagi) { Unagi.new(5) }

    it '引数で渡された人数と座席番号の seats に 1 が代入される' do
      unagi.seating(3, 2)
      expect(unagi.seats).to eq [0, 1, 1, 1, 0]
    end

    it '既に座席が埋まっている場合は、変化しない' do
      unagi.seating(1, 2)
      expect(unagi.seats).to eq [0, 1, 0, 0, 0]

      unagi.seating(3, 2)
      expect(unagi.seats).to eq [0, 1, 0, 0, 0]
    end

    it 'リングバッファ' do
      unagi.seating(3, 5)
      expect(unagi.seats).to eq [1, 1, 0, 0, 1]
    end
  end

  describe '#count' do
    let(:unagi) { Unagi.new(5).seating(3, 4) }

    it '1 の個数を返す' do
      expect(unagi.count).to eq 3
    end
  end

  describe 'total' do
    it '4 が正解' do
      unagi = Unagi.new(6)
      unagi.seating(3, 2)
      unagi.seating(1, 6)
      unagi.seating(2, 5)
      expect(unagi.count).to eq 4
    end

    it '12 が正解' do
      unagi = Unagi.new(12)
      unagi.seating(4,  6)
      unagi.seating(4,  8)
      unagi.seating(4, 10)
      unagi.seating(4, 12)
      unagi.seating(4,  2)
      unagi.seating(4,  4)
      expect(unagi.count).to eq 12
    end

    it '27 が正解' do
      unagi = Unagi.new(50)
      unagi.seating(3, 41)
      unagi.seating(2, 41)
      unagi.seating(1, 46)
      unagi.seating(2, 37)
      unagi.seating(7, 18)
      unagi.seating(7,  9)
      unagi.seating(1, 18)
      unagi.seating(1, 27)
      unagi.seating(1,  7)
      unagi.seating(4, 50)
      unagi.seating(1, 41)
      unagi.seating(1, 21)
      unagi.seating(6, 16)
      unagi.seating(5, 22)
      unagi.seating(4, 20)
      unagi.seating(7, 37)
      unagi.seating(1, 33)
      unagi.seating(6, 24)
      unagi.seating(1, 37)
      unagi.seating(1, 46)
      expect(unagi.count).to eq 27
    end
  end
end
