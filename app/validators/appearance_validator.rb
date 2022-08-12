# frozen_string_literal: true

class AppearanceValidator < ActiveModel::Validator
  def validate(record)
    if Appearance.find_by(word_id: record[:word_id], appr_id: record[:appr_id])
      record.errors[:base] << "指定したLESSONは既に登録されています。"
    end
  end
end
