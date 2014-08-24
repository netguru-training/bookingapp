require 'rails_helper'

RSpec.describe Place, type: :model do

  it { is_expected.to respond_to :user }
  it { is_expected.to respond_to :reviews }
  it { is_expected.to respond_to :bookings }

  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:street) }
  it { is_expected.to validate_presence_of(:beds) }
  it { is_expected.to validate_presence_of(:street) }

  it { is_expected.to validate_uniqueness_of(:name) }

  it { is_expected.to allow_value(1.0).for(:price) }

  describe '.full_street_addres' do
    it 'returns full adress name' do
      place = Place.new(city: 'Białystok', street: 'Lipowa') 
      expect(place.full_street_address).to eq 'Lipowa,Białystok'
    end
  end

  describe '.bookings_count' do
    place = Place.new
    before {place.bookings += [Booking.new, Booking.new] }

    it 'calculates amount of bookings' do  
      expect(place.bookings_count).to eq 2
    end
  end
end
