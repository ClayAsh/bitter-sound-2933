require 'rails_helper'

RSpec.describe 'Contestant index page' do 
  recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
  news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
  jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
  gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
  ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
  ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
  
  it 'lists names of all contenstants' do 
    visit '/contestants'

    expect(page).to have_content("#{jay.name}")
    expect(page).to have_content("#{gretchen.name}")
  end

  it 'lists contestant project names' do 
    visit '/contestants'

    within("##{jay.id}")
    expect(page).to have_content("News Chic")
  end

end