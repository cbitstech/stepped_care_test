# filename: researcher_arms_spec.rb

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud'

describe 'Research, Arms', type: :feature, sauce: sauce_labs do
  before(:each) do
    visit ENV['Base_URL'] + '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: ENV['User_Email']
      fill_in 'user_password', with: ENV['User_Password']
    end
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully'

    expect(page).to have_content 'CSV Reports'

    click_on 'Arms'
    expect(page).to have_content 'Listing Arms'
  end

  # tests
  # Testing creating an arm
  it '- create an arm' do
    click_on 'New'
    expect(page).to have_content 'New Arm'

    fill_in 'arm_title', with: 'Test Arm'
    click_on 'Create'
    expect(page).to have_content 'Arm was successfully created.'
  end

  # Testing updating an arm
  it '- update an arm' do
    click_on 'Arm 1'
    expect(page).to have_content 'Title: Arm 1'

    click_on 'Edit'
    expect(page).to have_content 'Editing Arm'

    fill_in 'arm_title', with: 'Updated Arm 1'
    click_on 'Update'
    expect(page).to have_content 'Arm was successfully updated.'

    expect(page).to have_content 'Title: Updated Arm 1'
    click_on 'Edit'
    expect(page).to have_content 'Editing Arm'

    fill_in 'arm_title', with: 'Arm 1'
    click_on 'Update'
    expect(page).to have_content 'Arm was successfully updated.'

    expect(page).to have_content 'Title: Arm 1'
  end

  # Testing destroying an arm
  it '- destroys an arm' do
    click_on 'Test Arm'
    expect(page).to have_content 'Title: Test Arm'

    click_on 'Destroy'
    page.accept_alert 'Are you sure?'
    expect(page).to have_content 'Arm was successfully destroyed.'

    expect(page).to_not have_content 'Test Arm'
  end
end
