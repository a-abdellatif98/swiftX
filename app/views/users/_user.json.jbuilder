json.extract! user,
              :id,
              :email,
              :permission_level,
              :password,
              :created_at,
              :updated_at
json.url user_url(user, format: :json)
json.token user.generate_jwt
