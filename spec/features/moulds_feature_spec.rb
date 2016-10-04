require 'rails_helper'

feature 'moulds' do
  context 'no moulds have been added' do
    scenario 'should display a prompt to add a mould' do
      visit '/'
      expect(page).to have_content 'No moulds yet'
      expect(page).to have_link 'Add a mould'
    end
  end

  context 'creating a mould' do
    scenario 'needs an image to create a post' do
      visit '/'
      click_link 'Add a mould'
      fill_in 'Name', with: 'example'
      click_button 'Create Mould'
      expect(page).to have_content('Please upload a mould')
    end
  end

  context 'moulds have been added' do
    scenario 'display moulds' do
      upload_mould
      visit '/'
      expect(page).to have_css("img[src*='example.png']")
      expect(page).to have_content('example')
      expect(page).not_to have_content('No moulds yet')
    end
  end

  context 'displays a single mould' do
    let!(:mould) { FactoryGirl.create(:mould) }
    before do
      visit '/'
      find(:xpath, "//a[contains(@href,'/moulds/1')]").click
    end
    scenario 'show the picture' do
      expect(page).to have_css("img[src*='example.png']")
      expect(page).to have_content('example')
      expect(current_path).to eq "/moulds/#{mould.id}"
    end
  end
end
