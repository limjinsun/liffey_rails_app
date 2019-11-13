json.extract! course, :id, :name, :price, :specialprice, :specialdue, :description, :admintext, :created_at, :updated_at
json.url course_url(course, format: :json)
