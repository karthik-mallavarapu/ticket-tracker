module Admin::PermissionsHelper

	def permissions
		{
			"view" => "View Project",
			"create tickets" => "Create Tickets",
			"edit tickets" => "Edit Tickets",
			"delete tickets" => "Delete Tickets"
		}

	end

end
