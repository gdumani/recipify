require 'rails_helper'
require_relative 'test_helper'

RSpec.describe 'Shopping List Page', type: :system do
  add_info_to_db

  describe 'the sign-in process', type: :feature do
    it "signs me in" do
      login(user.email, user.password)
      expect(page).to have_content 'Recipify' # Name of the app at the top (navbar)
    end
  end

  describe 'shopping list functionality' do
    before do
      login(user.email, user.password)
      visit shopping_list_path
      sleep(5)
    end

    scenario 'User can see the shopping list' do
      expect(page).to have_content('Shopping List')
      expect(page).to have_content('Total Food Items:')
      expect(page).to have_content('Total Price: $0.00') # Modify this if you expect a non-zero price

      # Add your expectations for the shopping list items here
      expect(page).to have_content('Food 1')
      expect(page).to have_content('2') # Replace with the expected quantity
      expect(page).to have_content('$5.99') # Replace with the expected price
    end
  end
end
