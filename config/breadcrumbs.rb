crumb :root do
  link "トップページ", root_path
end

crumb :new_idea do
  link "アイデア新規投稿", new_idea_path
  parent :root
end

crumb :idea_show do |idea|
  link "アイデア詳細", idea_path(idea.id)
  parent :root
end

crumb :new_recruit do
  link "募集新規募集", new_recruit_path
  parent :root
end

crumb :recruit_show do |recruit|
  link "募集詳細", recruit_path(recruit.id)
  parent :root
end

crumb :edit_idea do |idea|
  link "アイデア編集", edit_idea_path
  parent :idea_show,idea
end

crumb :idea_purchase do |idea|
  link "アイデア購入", idea_idea_purchases_path
  parent :idea_show,idea
end

crumb :edit_recruit do |recruit|
  link "募集内容編集", edit_recruit_path
  parent :recruit_show,recruit
end

crumb :new_tweet do |recruit|
  link "アイデア新規募集", new_recruit_tweet_path
  parent :recruit_show, recruit
end

crumb :tweet_purchase do |recruit|
  link "アイデア購入" , recruit_tweet_tweet_purchases_path
  parent :recruit_show, recruit
end

crumb :edit_tweet do |recruit|
  link "アイデア編集", edit_recruit_tweet_path
  parent :recruit_show ,recruit
end

crumb :search_idea do
  link "アイデア検索", search_ideas_path
  parent :root
end

crumb :user_show do |user|
  link "ユーザー情報",  user_path(user.id)
  parent :root
end

crumb :user_edit do |user|
  link "ユーザー情報編集", edit_user_registration_path
  parent :user_show, user
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).