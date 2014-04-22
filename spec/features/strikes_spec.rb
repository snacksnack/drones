require 'spec_helper'

feature 'user hits strike index page' do
  subject { page }

  describe "strikes index page" do
    before { visit strikes_path }
    it { should have_title('DroneStrike - All strikes') }
    it { should have_css('div.modal') }
    it { should have_css('div#map') }
  end
end