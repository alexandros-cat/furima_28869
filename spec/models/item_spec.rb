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
        expect(@item.errors.full_messages).to include("Nameを入力してください")
      end

      it 'item_text がない場合は登録できないこと' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item textを入力してください")
      end

      it 'condition_idがない場合は登録できないこと' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Conditionを入力してください")
      end

      it 'shipping_charge_id がない場合は登録できないこと' do
        @item.shipping_charge_id =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping chargeを入力してください")
      end

      it 'origin_id がない場合は登録できないこと' do
        @item.origin_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Originを入力してください")
      end

      it 'delivery_days_id がない場合は登録できないこと' do
        @item.delivery_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery daysを入力してください")
      end

      it 'priceがない場合は登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceを入力してください")
      end

      it 'category_idがない場合は登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryを入力してください")
      end

      it 'user_idがない場合は登録できないこと' do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end

      it '全て揃っている時保存できる' do
        expect(@item).to be_valid
      end
      it 'category_idの選択が「---」の時は登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryは1以外の値にしてください")
      end
      it 'condition_idの選択が「---」の時は登録できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Conditionは1以外の値にしてください")
      end
      it 'origin_id の選択が「---」の時は登録できないこと' do
        @item.origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Originは1以外の値にしてください")
      end

      it 'delivery_days_idの選択が「---」の時は登録できないこと' do
        @item.delivery_days_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery daysは1以外の値にしてください")
      end
      it 'shipping_charge_idの選択が「---」の時は登録できないこと' do
        @item.shipping_charge_id  = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping chargeは1以外の値にしてください")
      end
      it'priceが299以下の場合は登録できない'do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは300以上の値にしてください")
      end
      it'priceが10000000以上の場合は登録できない'do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは9999999以下の値にしてください")
      end
      it'price半角数字以外だと登録できないこと'do
       @item.price = '２０００'
       @item.valid?
       expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end  
      it "画像がないとツイートは保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Imageを入力してください")
      end 
    end  
 end  
end