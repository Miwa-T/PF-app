# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tag_mapモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { tag_map.valid? }

    let!(:other_user) { create(:user) }
    let(:tag_map) { build(:tag_map, post_image_id: post_image.id) }

    context 'post_image_idカラム' do
      it '空欄でないこと' do
        tag_map.post_image = ''
        is_expected.to eq false
      end
    end

    context 'tag_idカラム' do
      it '空欄でないこと' do
        tag_map.tag_id = ''
        is_expected.to eq false
      end
    end
  end
end