require 'rails_helper'
require_relative 'test_helper'

RSpec.describe 'Shopping List Page', type: :system do
  add_info_to_db

  describe 'shopping list functionality' do
    before do
      login(user.email, user.password)
      visit '/shopping_list'
      sleep(2)
    end

    scenario 'User can see the shopping list' do
      expect(page).to have_content('Shopping List')
      expect(page).to have_content('Total Food Items:')
      expect(page).to have_content('Total Price')

      # expectations for the shopping list items
      expect(page).to have_content('Food 1')
      expect(page).to have_content('Food 2')
      expect(page).to have_content('90') # expected quantity
      expect(page).to have_content('80') # expected quantity
    end
  end
end
