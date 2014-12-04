#filename: other_navbar_functionality_spec.rb

#this file is to test the functionality of navbar not covered in the other specs

require_relative '../../../spec/spec_helper'
require_relative '../../../spec/configure_cloud_saucelabs'

#to run locally comment this line out
# describe "Other navbar functionality", :type => :feature, :sauce => true do

#to run on Sauce Labs comment this block out
describe "Other navbar functionality", :type => :feature, :sauce => false do

  before(:each) do
    Capybara.default_driver = :selenium
  end

#tests

  #Testing the Sign Out functionality
  it "- sign out" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'

    page.find('#navbar-collapse').find(:xpath, "(//a[@href='/participants/sign_out'])[1]").click
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  #Testing Replay Intro button functionality
  it "- replay intro" do
    visit 'https://steppedcare-staging.cbits.northwestern.edu/participants/sign_in'
    within("#new_participant") do
      fill_in 'participant_email', :with => ENV['Participant_Email']
      fill_in 'participant_password', :with => ENV['Participant_Password']
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'

    page.find('#navbar-collapse').find(:xpath, "(//a[@href='/participants/public_slideshows/8/slides/7'])[1]").click
    expect(page).to have_content 'Welcome to ThinkFeelDo'
    click_on 'Continue'
    expect(page).to have_content 'How to Maximize Your Benefit from ThinkFeelDo'
    click_on 'Continue'
    expect(page).to have_content 'What Should I Do When I Log in?'
    click_on 'Continue'
    expect(page).to have_content "How Do I Know What's New on the Site?"
    click_on 'Continue'
    expect(page).to have_content 'What Should I Expect?'
    click_on 'Continue'
    expect(page).to have_content 'What Might Get in the Way?'
    click_on 'Continue'
    expect(page).to have_content 'Get Started'
    click_on 'Done'
    expect(page).to have_content 'Signed in as'
  end
end