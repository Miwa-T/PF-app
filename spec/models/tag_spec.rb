# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tagモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { tag.valid? }

    let!(:tag) { build(:tag) }

    context 'tag_nameカラム' do
      it '空欄でないこと' do
        tag.tag_name = ''
        is_expected.to eq false
      end

      it '99文字以下であること' do
        tag.tag_name = Faker::Lorem.characters(number: 100)
        is_expected.to eq false
      end
    end
  end
end
