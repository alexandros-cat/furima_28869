require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/Railsの処理の流れ_0409.png')
    end

    context 'itemが保存できない場合' do
      it 'nameがない場合は登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'item_text がない場合は登録できないこと' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end

      it 'condition_idがない場合は登録できないこと' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_charge_id がない場合は登録できないこと' do
        @item.shipping_charge_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it 'origin_id がない場合は登録できないこと' do
        @item.origin_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Origin can't be blank")
      end

      it 'delivery_days_id がない場合は登録できないこと' do
        @item.delivery_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank")
      end

      it 'priceがない場合は登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'category_idがない場合は登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'user_idがない場合は登録できないこと' do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end

      it '全て揃っている時保存できる' do
        @item = FactoryBot.build(:item)
        expect(@item).to be_valid
      end
      it 'category_idの選択が「---」の時は登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be select")
      end
      it 'condition_idの選択が「---」の時は登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be select")
      end
      it 'origin_id の選択が「---」の時は登録できないこと' do
        @item.origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Origin must be select")
      end
      it 'delivery_days_idの選択が「---」の時は登録できないこと' do
        @item.delivery_days_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days must be select")
      end
      it 'shipping_charge_idの選択が「---」の時は登録できないこと' do
        @item.shipping_charge_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be select")
      end
    end
  end
end

