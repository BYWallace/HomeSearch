require 'csv'

class UploadedTransaction < ApplicationRecord
  belongs_to :listing_agent, required: false, class_name: "Agent"
  belongs_to :selling_agent, required: false, class_name: "Agent"

  validates :address, :city, :state, :zip, :selling_date, :selling_price, presence: true
  validates :selling_price, :listing_price, numericality: { greater_than: 0, allow_nil: true }

  default_scope { order(selling_date: :desc) }
  scope :single_family_homes, -> { where(property_type: "single_family_home") }
  scope :sold, -> { where(status: "sold") }

  def self.csv_import(file, listing_agent_id)
    uploaded_transactions = []
    CSV.foreach(file.path, headers: true) do |row|
      uploaded_transactions << row.to_h.merge(listing_agent_id: listing_agent_id)
    end
    uploaded_transactions.uniq!{ |transaction| transaction.values_at("address", "zip", "selling_date") }
    UploadedTransaction.import(uploaded_transactions)
  end

  def full_address
    "#{address}, #{city}, #{state} #{zip}"
  end
end
