json.user_name = @comment.user.name
json.time = @comment.created_at.strftime("%Y/%m/%d %H:%M")
json.text = @comment.text
