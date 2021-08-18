require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.save
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@order_address).to be_valid
      end
      it ' buildingは空でも登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが[1]では登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'tel_numberが空では登録できない' do
        @order_address.tel_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number can't be blank", "Tel number is invalid")
      end
      it 'postal_codeにはハイフンが入っていないと登録できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'tel_numberは数値以外の値では登録できない' do
        @order_address.tel_number = 'あああ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid")
      end
      it 'tel_numberが10桁未満だと登録ができない' do
        @order_address.tel_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid")
      end
      it 'tel_numberが12桁以上だと登録ができない' do
        @order_address.tel_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid")
      end
      it 'user_idがないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録ができない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
