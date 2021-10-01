# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid inputs' do
      visit new_book_path
      fill_in 'Title', with: 'harry potter'
      fill_in 'Author', with: 'J.K. Rowling'
      fill_in 'Price', with: '9.99'
      fill_in 'PublishDate', with: '2018-03-12'
      # find_field("PublishDate").tap { |f| puts f.value.inspect }.set('2018-03-12')
      # find_field("PublishDate").tap { |f| puts f.value.inspect }
      click_on 'Create Book'
      visit books_path
      expect(page).to have_content('harry potter')
      expect(page).to have_content('J.K. Rowling')
      expect(page).to have_content('9.99')
      expect(page).to have_content('2018-03-12')
    end
end