# frozen_string_literal: true

json.extract! branch, :id, :name, :company_id, :user_id, :created_at, :updated_at
json.url branch_url(branch, format: :json)
