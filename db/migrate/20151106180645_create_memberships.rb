class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :membership_type, default: 'member'
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
