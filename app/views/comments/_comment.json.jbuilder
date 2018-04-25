json.extract! comment, :id, :title, :user_id, :campaign_id, :todo_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
