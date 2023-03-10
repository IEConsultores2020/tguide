# frozen_string_literal: true

json.extract! person, :id, :email, :name, :citizenship, :nid, :mobile, :branch_id, :created_at, :updated_at
json.url person_url(person, format: :json)
