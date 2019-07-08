require 'rails_helper'

feature "User views all ships" do
  let!(:ship_1) {
    Starship.create(name: "HMS Bounty", ship_class: "Boat", location: "Denver")
  }
  let!(:ship_2) {
    Starship.create(name: "Ironclad", ship_class: "Boat", location: "Boatswana")
  }

  context "by visiting the starships url" do
    before do
      visit '/starships'
    end

    scenario "displays all the campers" do
      expect(page).to have_content("All Starships:")
      expect(page).to have_content(ship_1.name)
      expect(page).to have_content(ship_2.name)
    end
  end

  context "by visiting the root path" do
    before do
      visit '/'
    end

    scenario "displays all the campers" do
      expect(page).to have_content("All Starships:")
      expect(page).to have_content(ship_1.name)
      expect(page).to have_content(ship_2.name)
    end
  end
end
