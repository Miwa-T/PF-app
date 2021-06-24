# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'post_imageモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post_image.valid? }

    let(:user) { create(:user) }
    let!(:post_image) { build(:post_image, user_id: user.id) }

    context 'imageカラム' do
      it '空欄でないこと' do
        post_image.image = ''
        is_expected.to eq false
      end
    end

    context 'explainカラム' do
      it '空欄でないこと' do
        post_image.explain = ''
        is_expected.to eq false
      end

      it '200文字以下であること' do
        post_image.explain = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end

    context 'titleカラム' do
      it '空欄でないこと' do
        post_image.title = ''
        is_expected.to eq false
      end
    end

    context 'captionカラム' do
      it '空欄でないこと' do
        post_image.caption = ''
        is_expected.to eq false
      end
    end
  end
end
