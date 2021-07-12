# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }


    context 'emailカラム' do
      it '空欄でないこと' do
        user.email = ''
        is_expected.to eq false
      end
    end
    context 'account_nameカラム' do
      it '空欄でないこと' do
        user.account_name = ''
        is_expected.to eq false
      end

      it '一意性があること' do
        user.account_name = other_user.account_name
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '200文字以下であること' do
        user.introduction = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end
end
