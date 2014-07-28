require './unagi.rb'

describe Unagi do
  describe '#seating' do
    it '「長テーブルの座席番号」と「お客さんの人数」を指定すると「座席にお客さんが配置される」' do
      unagi = Unagi.new
      unagi.seating(1, 3)
      expect(unagi.seats).to eq [1, 1, 1, 0, 0]
    end
  end
end
