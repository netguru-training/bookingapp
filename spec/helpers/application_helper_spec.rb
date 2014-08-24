require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#pretty_date' do
    subject { Time.now }

    context 'valid attributes' do
      it "returns formatted data" do
        expect(pretty_date(subject)).to eq(subject.strftime('%d/%m/%Y'))
      end
    end

    context 'invalid attributes' do
      it "returns formatted data of Time.now" do
        expect(pretty_date(nil)).to eq(subject.strftime('%d/%m/%Y'))
      end

      it "returns formatted data of Time.now" do
        expect(pretty_date()).to eq(subject.strftime('%d/%m/%Y'))
      end
    end
  end
end
