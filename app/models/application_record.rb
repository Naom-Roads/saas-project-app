class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # set_current_tenant_by_subdomain_or_domain(:account, :subdomain, :domain)
end
