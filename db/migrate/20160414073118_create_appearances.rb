# frozen_string_literal: true

class CreateAppearances < ActiveRecord::Migration[5.2]
  def change
    create_table :appearances, &:timestamps
  end
end
