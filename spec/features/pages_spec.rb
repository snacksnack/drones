require 'spec_helper'

feature 'user hits home page' do
  subject { page }

  describe "home page" do
    before { visit root_path }
    it { should have_title('DroneStrike - Visualizing drone data') }
    it { should have_css('div#chart-1')}
    it { should have_css('div#spy_chart_container')}
    it { should have_css('div#death_chart_container')}
  end
end