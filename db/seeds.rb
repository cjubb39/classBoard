# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
namespace :db do 
  desc "Seeds Database from random data and .csv input"
  task :seed => :environment do
    require 'csv'

    Mongoid.purge!

    Rake::Task['db:populateCoursesDB'].invoke

    #Generate primary User
    primaryUser = User.new(
      :first_name => "Chae",
      :last_name => "Jubb",
      :email => "ecj2122@columbia.edu",
      :password => "password"
    )
    primaryUser.save

    5.times do
      primaryUser.courses << Course.all.sample
    end

    #Generate secondary users
    users_path = Rails.root.join("importFiles", "users.csv")
    if File.file?(users_path)
          CSV.foreach(users_path, :headers => true) do |row|
        User.create(row.to_hash)
      end 
    else
      puts "./importFiles/users.csv does not exist! Skipped."
    end

    #Random Users
    50.times do
      user = Fabricate(:user)
      user.save
    end

    #Random associations
    200.times do
      c = Course.all.sample
      u = User.all.sample

      c.users << u unless c.users.include?(u)
    end
    
  end

end