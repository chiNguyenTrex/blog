namespace :elasticsearch do
  desc "Create index for elasticsearch model"
  task create_index: :environment do
    Project.__elasticsearch__.create_index!(force: true)
  end

  desc "Import project data"
  task import_project: :environment do
    Project.import
  end

end
