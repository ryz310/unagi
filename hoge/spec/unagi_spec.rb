require './unagi.rb'

describe Unagi do
  describe '#initialize' do
    it '指定した座席数のゼロ配列が確保される' do
      expect(Unagi.new(3).seats).to eq [0, 0, 0]
    end
  end

  describe '#seating' do
    it '「長テーブルの座席番号」と「お客さんの人数」を指定すると「座席にお客さんが配置される」' do
      unagi = Unagi.new(5)
      unagi.seating(1, 3)
      expect(unagi.seats).to eq [1, 1, 1, 0, 0]
    end

    it '長テーブルの座席は最初と最後の席がループしている' do
      unagi = Unagi.new(5)
      unagi.seating(5, 3)
      expect(unagi.seats).to eq [1, 1, 0, 0, 1]
    end
  end
end
