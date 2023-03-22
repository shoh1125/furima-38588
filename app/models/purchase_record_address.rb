class PurchaseRecordAddress 
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:post_code,:prefecture_id,:municipality,:address,:building_name,:tel_number,:token

  with_options presence: true do
  
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "can't be blank", message: "input collectly"}
    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
    validates :municipality 
    validates :address
    validates :tel_number, format: {with: /\A[0-9]{10,11}+\z/, message: "input only number"}
    validates :token

  end
  validate :building_name

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, tel_number: tel_number,purchase_record_id: purchase_record.id)
  end

end
