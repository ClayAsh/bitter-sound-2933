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

  it 'shows number of contestants on project' do 
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
    
    visit "/projects/#{news_chic.id}"

    expect(page).to have_content("Number of Contestants: 2")
  end
end