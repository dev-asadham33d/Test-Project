# frozen_string_literal: true

class CreateEmployments < ActiveRecord::Migration[7.0]
  def change
    create_table :employments do |t|
      t.string :employer
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
