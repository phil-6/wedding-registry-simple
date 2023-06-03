json.extract! item, :id, :name, :description, :link, :value, :ref, :bought, :bought_by, :bought_message, :created_at, :updated_at
json.url item_url(item, format: :json)
