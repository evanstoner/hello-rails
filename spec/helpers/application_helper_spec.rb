require 'spec_helper'

describe ApplicationHelper do

  describe "full_title" do
    it "should start with the page title" do
      expect(full_title("foo")).to match(/^foo/)
    end

    it "should end with the base title" do
      expect(full_title("foo")).to match(/Hello Rails$/)
    end

    it "should include a separator for non-home pages" do
      expect(full_title("foo")).to match(/-/)
    end

    it "should not include a separator for the home page" do
      expect(full_title("")).not_to match(/-/)
    end
  end
end