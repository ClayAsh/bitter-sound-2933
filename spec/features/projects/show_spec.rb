require 'rails_helper'

RSpec.describe 'Project show page' do 
  it 'shows projects name material and theme' do 
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    

    visit "/projects/#{news_chic.id}"

    expect(page).to have_content("#{news_chic.name}")
    expect(page).to have_content("#{news_chic.material}")
    expect(page).to have_content("Project Theme: Recycled Material")

    expect(page).to_not have_content("#{boardfit.name}")
    expect(page).to_not have_content("#{boardfit.material}")
  end
end