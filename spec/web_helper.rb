def upload_mould
  visit '/'
  click_link 'Add a mould'
  attach_file('mould[image]', "spec/fixtures/images/example.png")
  fill_in 'Name', with: 'example'
  click_button 'Create Mould'
end
