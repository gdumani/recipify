require 'rails_helper'
require_relative 'test_helper'

RSpec.describe 'Recipes Index Page', type: :system do
  add_info_to_db

  scenario 'User can see the list of recipes' do
    login(user.email, user.password)
    visit '/recipes_public'
    sleep(1) # Wait for the page to load

    expect(page).to have_content('Public Recipes')
    expect(page).to have_content('Test Recipe')
    expect(page).to have_content('By: Test User')
  end

  scenario 'User can click "New recipe" and be redirected to the new recipe page' do
    login(user.email, user.password)
    visit recipes_path
    click_button('New recipe')

    expect(current_path).to eq(new_recipe_path)
  end
end
