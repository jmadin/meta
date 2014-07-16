## Oldfield

# Photo

    $ rails generate scaffold Photos user:references photo_filename:string photo_date:date genus_species:string photo_notes:text
    $ bundle exec rake db:migrate


    $ rails generate migration AddCategoryToPhotos category:references
    $ bundle exec rake db:migrate

# Category

    $ rails generate scaffold Categories category_name:string category_description:text
    $ bundle exec rake db:migrate


# Photo Category

    $ rails generate scaffold Photos_Categories photo:references category:references
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
