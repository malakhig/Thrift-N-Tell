json.extract! thrift, :id, :store, :address, :phone, :city, :state, :hours, :created_at, :updated_at
json.url thrift_url(thrift, format: :json)
