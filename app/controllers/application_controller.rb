require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        # renders super hero form
        erb :super_hero
    end

    post '/team' do
        # create a team out of info user submitted
        @team = Team.new(params[:team])

        # loop through the array hashes of heroes user submitted
        params[:team][:heros].each do |hero_details|
            #create a new hero out of the hero details provided
            Hero.new(hero_details)
        end

        # assign to instance var heros the array of the heros created
        @heros = Hero.all

        # renders created team page
        erb :team
    end
end
