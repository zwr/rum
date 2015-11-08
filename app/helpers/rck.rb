module Rck
  class Error < StandardError
  end

  class NotAdminError < Error
    def message
      %(User that is not an organization admin has tried to perform an admin operation.
        This incident will be reported.)
    end
  end

  class NotSuperAdminError < Error
    def message
      %(Only superadmin can perform this operation.
        This incident will be reported.)
    end
  end
end
