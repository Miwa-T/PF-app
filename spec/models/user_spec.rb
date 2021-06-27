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

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
      end

      it '一意性があること' do
        user.name = other_user.name
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
      it '空欄でないこと' do
        user.introduction = ''
        is_expected.to eq false
      end

      it '200文字以下であること' do
        user.introduction = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end

    context 'numberカラム' do
      it '空欄でないこと' do
        user.number = ''
        is_expected.to eq false
      end

      it '数値入力であること' do
        user.number = Faker::Number.between(to: 11)
        is_expected.to eq true
      end
    end
  end
end
