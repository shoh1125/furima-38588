class CreatePurchaseRecordAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_record_addresses do |t|

      t.timestamps
    end
  end
end
