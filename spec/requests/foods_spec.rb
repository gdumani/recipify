require 'rails_helper'

RSpec.describe 'Foods Index Page', type: :system do
  let!(:user) do
    User.create(
      name: 'Test User',
      email: 'test@example.com',
      password: 'password'
    )
  end

  let!(:food1) do
    Food.create(
      name: 'Food 1',
      measurement_unit: 'Grams',
      price: 5.99,
      quantity: 10,
      user: user
    )
  end

  let!(:food2) do
    Food.create(
      name: 'Food 2',
      measurement_unit: 'Pieces',
      price: 2.49,
      quantity: 20,
      user: user
    )
  end

  # before do
  #   sign_in user # Sign in as the user using Devise
  # end

  scenario 'User can see the list of foods' do
    visit index_path
    sleep(5)
    expect(page).to have_content('Foods')
    # expect(page).to have_content('Add Food')
    # expect(page).to have_content('Food 1')
    # expect(page).to have_content('Grams')
    # expect(page).to have_content('$5.99')
    # expect(page).to have_content('Food 2')
    # expect(page).to have_content('Pieces')
    # expect(page).to have_content('$2.49')
  end

  # scenario 'User can click "Add Food" and be redirected to the new food page' do
  #   visit foods_path
  #   click_link('Add Food')

  #   expect(current_path).to eq(new_food_path)
  # end

  # Add more scenarios as needed for your application's features

end
