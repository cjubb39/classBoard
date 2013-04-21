namespace :db do
  desc "Populates the Courses DB with courses from .csv file"
  task :populateCoursesDB => :environment do
    
    puts "Beginning read of .csv"

    require 'csv'

    courses_path = Rails.root.join("importFiles", "courses.csv")

    if File.exists?(courses_path)
      CSV.foreach(courses_path, :headers => true) do |row|
        Course.create(row.to_hash)
      end
    else
      puts "./importFiles/courses.csv does not exist! Skipped."
    end

    puts ".csv Imported!"

  end
end