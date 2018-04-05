namespace :linux_command do
  desc "Git status"
  task git_status: :environment do
    sh "git status"
  end

  desc "Git add all"
  task staged_all: :environment do
    sh "git add -A"
  end

  task :all_in_one, [:message, :branch] do |t, args|
    sh "git add ."
    sh "git status"
    sh "git commit --amend -m '#{args.message}'"
    sh "git push origin #{args.branch}"
  end
end
