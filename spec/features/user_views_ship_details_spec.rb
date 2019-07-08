require 'rails_helper'

feature "User views details of one ship" do

  context "by ship show url" do
    let!(:ship_1) {
      Starship.create(name: "HMS Bounty", ship_class: "Boat", location: "Denver")
    }
    let!(:ship_2) {
      Starship.create(name: "Ironclad", ship_class: "Boat", location: "Boatswana")
    }

    before do
      visit "/starships/#{ship_1.id}"
    end

    scenario "displays the name, class, and location of the specified ship" do
      expect(page).to have_content(ship_1.name)
      expect(page).to have_content(ship_1.ship_class)
      expect(page).to have_content(ship_1.location)
    end

    scenario "does not display information for any other ship" do
      expect(page).to_not have_content(ship_2.name)
    end
  end
end
