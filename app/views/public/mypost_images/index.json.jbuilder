json.array!(@post_images) do |mypost_image|
  json.extract! mypost_image, :id, :title, :explain
  json.start mypost_image.created_at
  json.end mypost_image.created_at
  json.url post_image_url(mypost_image.id, format: :html)
end
