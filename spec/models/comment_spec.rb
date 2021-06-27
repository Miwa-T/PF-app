# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'commentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { comment.valid? }

    let(:user) { create(:user) }
    let!(:comment) { build(:comment) }

    context 'commentカラム' do
      it '空欄でないこと' do
        comment.comment = ''
        is_expected.to eq false
      end
    end
  end
end
