
local id = param.get("id")

if not id then
  ui.title("Cancel issue")
  ui.actions()
  ui.form{
    module = "admin",
    view = "cancel_issue",
    content = function()
      ui.field.text{ label = _"Issue ID", name = "id" }
      ui.submit{ text = _"Cancel issue" }
    end
  }
else
 
  local issue = Issue:by_id(id)
 
  ui.title(_("Cancel issue #{id}", { id = issue.id }))
  ui.actions()

    
  execute.view{ module = "initiative", view = "_list", params = {
    initiatives_selector = issue:get_reference_selector("initiatives")
  } }

  ui.form{
    module = "admin",
    action = "cancel_issue",
    id = id,
    attr = { class = "vertical" },
    content = function()
      ui.field.text{ label = _"Public administrative notice:", name = "admin_notice", multiline = true }
      ui.submit{ text = _"Cancel issue now" }
    end
  }

end
