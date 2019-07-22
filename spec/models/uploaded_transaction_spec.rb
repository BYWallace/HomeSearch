describe UploadedTransaction, type: :model do

	describe 'validations' do
		it { should validate_presence_of(:address) }
		it { should validate_presence_of(:city) }
		it { should validate_presence_of(:state) }
		it { should validate_presence_of(:zip) }
		it { should validate_presence_of(:selling_date) }
		it { should validate_presence_of(:selling_price) }

		it { should validate_numericality_of(:listing_price) }
		it { should validate_numericality_of(:selling_price).is_greater_than(0).allow_nil }
	end
	
	describe 'default scope' do
		let!(:oldest_transaction) { create :uploaded_transaction, selling_date: Date.today - 3, city: "Oldest" }
		let!(:newest_transaction) { create :uploaded_transaction, selling_date: Date.today - 1, city: "Newest" }
		let!(:middle_transaction) { create :uploaded_transaction, selling_date: Date.today - 2, city: "Middle" }

	
		it 'orders by most recent selling date' do
			UploadedTransaction.pluck(:city).should eq [newest_transaction, middle_transaction, oldest_transaction].map(&:city)
		end
	end
  
  # describe "#all_transactions" do
  #   let(:agent) { create :agent }
  #   let!(:agent_selling_transactions) { create_list :uploaded_transaction, 5, selling_agent: agent }
  #   let!(:agent_listing_transactions) { create_list :uploaded_transaction, 5, listing_agent: agent }
  #   let!(:other_transactions) { create_list :uploaded_transaction, 10 }

  #   it "should return transactions where agent is respresented" do
  #     expect(agent.all_transactions.count).to eq 10
  #   end
  # end

  # describe "#recent_transactions" do
  #   let(:agent) { create :agent }
  #   let!(:recent_agent_selling_transactions) { create_list :uploaded_transaction, 5, selling_agent: agent, selling_date: 2.months.ago }
  #   let!(:recent_agent_listing_transactions) { create_list :uploaded_transaction, 5, listing_agent: agent, selling_date: 2.months.ago }
  #   let!(:old_agent_selling_transactions) { create_list :uploaded_transaction, 5, selling_agent: agent, selling_date: 1.year.ago }
  #   let!(:old_agent_listing_transactions) { create_list :uploaded_transaction, 5, listing_agent: agent, selling_date: 1.year.ago }
  #   let!(:other_transactions) { create_list :uploaded_transaction, 10 }

  #   it "should return transactions where agent is respresented and the selling date is less than 6 months ago" do
  #     expect(agent.recent_transactions.count).to eq 10
  #   end
  # end

  describe "#full_address" do
    let(:uploaded_transaction) { create :uploaded_transaction, address: "123 Main St", city: "Cambridge", state: "MA", zip: "02142" }

    it "should display the uploaded transaction's full address" do
      expect(uploaded_transaction.full_address).to eq "123 Main St, Cambridge, MA 02142"
    end
  end

end
