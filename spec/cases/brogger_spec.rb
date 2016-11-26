describe Brogger do

  let(:logdev) { $stdout }
  let(:subject) { described_class.new logdev }


  context 'changing levels with a symbol' do

    described_class.const_get(:LEVEL_MAPPING).each_pair do |sym, level|
      it "changes level to #{sym}" do
        expect(subject.level).not_to eq sym
        subject.level = sym
        expect(subject.level).to eq level
      end
    end

    it 'uses UNKNOWN when the symbol is unrecognized' do
      sym = :blark
      expect(described_class.const_get(:LEVEL_MAPPING).has_key?(sym)).to be_falsey
      subject.level = sym
      expect( subject.level).to eq ::Logger::UNKNOWN 
    end

  end

end
