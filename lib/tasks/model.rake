namespace :model do
  desc "Set admin user"
  task set_admin_user: :environment do
    User.first.add_role :admin
  end

  desc "Create event"
  task create_event: :environment do
    Event.create name: Faker::RockBand.name
  end
end
