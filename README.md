## Oldfield

# Datasets

    $ rails generate scaffold Datasets user:references unit:references project_name:string project_date:date project_location:string latitude:decimal longitude:decimal methods:text missing_data:string project_notes:text
    $ bundle exec rake db:migrate

rails generate migration AddDataToDatasets data:text
bundle exec rake db:migrate

rails generate migration AddConvenorToUsers convenor:boolean
bundle exec rake db:migrate


# headers

    $ rails generate scaffold Header dataset:references header_name:string header_unit:string header_notes:text 
    $ bundle exec rake db:migrate


# Unit

    $ rails generate scaffold Units user:references unit_name:string unit_code:string unit_description:text
    $ bundle exec rake db:migrate


# Setup

    $ git clone git@github.com:jmadin/ita.git
    $ git pull master origin
    $ bundle update
    $ bundle exec rake db:migrate RAILS_ENV="production"
    $ rake tmp:clear
    $ bundle exec rake assets:precompile RAILS_ENV=production RAILS_GROUPS=assets
    $ rails s -e production -p 3009

# Production

    $ bundle exec rake db:migrate RAILS_ENV="production"
    $ rake tmp:clear
    $ bundle exec rake assets:precompile RAILS_ENV=production RAILS_GROUPS=assets
    $ rails s -e production -p 3003

delete from photos;
delete from sqlite_sequence where name='photos';


Photo.new({:user_id => 1, :photo_filename => "test", :photo_date => "2014-07-01", :genus_species => "", :photograph => File.new("/Users/jmadin/Desktop/test.png", "r")}).save
