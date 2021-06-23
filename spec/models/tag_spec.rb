# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tagモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { tag.valid? }

    let(:user) { create(:user) }
    let!(:tag) { build(:tag, user_id: user.id) }

