require 'spec_helper'

describe User do
  
  before { @user = User.new(name: "Example User", email: "user@example.com", password: "password", password_confirmation: "password") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  ### name ###

  describe "when name is blank" do
    before { @user.name = "" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email is blank" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  ### email ###

  describe "when email format is valid" do
    it "should be valid" do
      emails = %w[name@foo.com first_last@foo.com first.last@foo.com name1@foo.com name@foo.bar.com]
      emails.each do |email|
        @user.email = email
        expect(@user).to be_valid
      end
    end
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      emails = %w[name@foo,com first-last@foo.com foo.com]
      emails.each do |email|
        @user.email = email
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email is already in use" do
    before do
      dup_user = @user.dup
      dup_user.email = dup_user.email.upcase
      dup_user.save
    end
    it { should_not be_valid }
  end

  ### password and password_confirmation ###

  describe "when password is blank" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com", password: "", password_confirmation: "")
    end
    it { should_not be_valid }
  end

  describe "when password and confirmation don't match" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when a password is too short" do
    before { @user.password = @user.password_confirmation = "a" * 7 }
    it { should_not be_valid }
  end

  ### authentication ###

  describe "authentication" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end

end
