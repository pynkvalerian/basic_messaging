json.array!(@jobs) do |job|
  json.extract! job, :id, :brand_id, :title
  json.url job_url(job, format: :json)
end
