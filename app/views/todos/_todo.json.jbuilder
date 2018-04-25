json.extract! todo, :id, :content, :user_id, :campaign_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
