require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before(:each) do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '購入情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
      it '正しく保存されるとOrderとAddressが両方作成されること' do
        expect { @order_address.save }.to change { Order.count }.by(1).and change { Address.count }.by(1)
      end
      it '作成されたAddressのorder_idが、作成されたOrderのidと一致すること' do
        @order_address.save
        order = Order.find_by(user_id: @order_address.user_id, item_id: @order_address.item_id)
        address = Address.find_by(order_id: order.id)
        expect(address.order_id).to eq(order.id)
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureが空（---）では保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'townが空だと保存できないこと' do
        @order_address.town = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Town can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @order_address.street = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneは9桁以下の半角数値だと保存できないこと' do
        @order_address.phone = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is too short')
      end
      it 'phoneは12桁以上の半角数値だと保存できないこと' do
        @order_address.phone = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is too short')
      end
      it 'phoneは半角数字でないと保存できないこと' do
        @order_address.phone = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is too short')
      end
      it 'phoneは半角数字以外の文字を含むと保存できないこと' do
        @order_address.phone = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is too short')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
