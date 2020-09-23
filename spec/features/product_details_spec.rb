require 'rails_helper'

RSpec.feature "Visitor navigates from home page to the product detail by clicking on a poduct", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see specific product" do
    # ACT
    visit root_path

    first(:link_or_button, 'Details').click

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content('Description')
  end
end