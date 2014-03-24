require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
  	it "should have the content 'Hello Rails'" do
  		visit '/static_pages/home'
  		expect(page).to have_content('Hello Rails')
  	end

  	it "should have the right title" do
  		visit '/static_pages/home'
  		expect(page).to have_title("Home - Hello Rails")
  	end
  end

  describe "Help page" do
  	it "should have the content 'Help'" do
  		visit '/static_pages/help'
  		expect(page).to have_content('Help')
  	end

  	it "should have the right title" do
  		visit '/static_pages/help'
  		expect(page).to have_title("Help - Hello Rails")
  	end
  end

  describe "About page" do
  	it "should have the content 'About'" do
  		visit '/static_pages/about'
  		expect(page).to have_content('About')
  	end

  	it "should have the right title" do
  		visit '/static_pages/about'
  		expect(page).to have_title("About - Hello Rails")
  	end
  end
end
