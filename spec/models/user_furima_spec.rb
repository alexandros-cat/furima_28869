require 'rails_helper'
RSpec.describe User , type: :model do
  before do
    @shippingaddress = FactoryBot.build(:user_furima)
  end
 
  describe '購入'do
    context '購入がうまく行かない時' do
      it " tokenが空白の時は購入できない" do
        @shippingaddress.token = "  "
        @shippingaddress.valid?
        expect(@shippingaddress.errors.full_messages).to include("Token can't be blank")
      end
      it " postal_codeが空白の時は購入できない" do
        @shippingaddress.postal_code = "  "
        @shippingaddress.valid?
        expect(@shippingaddress.errors.full_messages).to include("Postal code can't be blank")
      end
      it ' origin_idの選択が「---」の時は購入できない' do
        @shippingaddress.origin_id = "1"
        @shippingaddress.valid?
        expect(@shippingaddress.errors.full_messages).to include("Origin must be other than 1")  
      end
      it " cityが空白の時は購入できない" do
        @shippingaddress.city = "  "
        @shippingaddress.valid?
        expect(@shippingaddress.errors.full_messages).to include("City can't be blank")
      end
      it " address_lineが空白の時は購入できない" do
        @shippingaddress.address_line = "  "
        @shippingaddress.valid?
        expect(@shippingaddress.errors.full_messages).to include("Address line can't be blank")
      end
      it " phone_numberが空白の時は購入できない" do
        @shippingaddress.phone_number = "  "
        @shippingaddress.valid?
        expect(@shippingaddress.errors.full_messages).to include("Phone number can't be blank")
      end
      it " phone_numberが11桁の時は購入できない" do
        @shippingaddress.phone_number = "/\A\d{11}\z/" 
        @shippingaddress.valid?
        expect(@shippingaddress.errors.full_messages).to include("Phone number is invalid")
      end
      it " postal_codeがハイフンがない時は購入できない" do
        @shippingaddress.postal_code = "/\A\d{11}\z/" 
        @shippingaddress.valid?
        expect(@shippingaddress.errors.full_messages).to include("Postal code is invalid")
      end
    end    
  end
end