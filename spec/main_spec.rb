require_relative '../lib/scrapper.rb'

RSPec.describe UniversityPrograms do
  obj_uni = UniversityPrograms.new

  describe '#parsing' do
    it 'returns the university programs' do
      expect(obj_uni.parsing).not_to be_empty
    end

    it 'returns the university programs' do
      expect(obj_uni.parsing).not_to be_nil
    end
  end
end
