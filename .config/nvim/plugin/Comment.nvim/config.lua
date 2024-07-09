require("if_installed")("Comment", function(comment)
	comment.setup({
		pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
	})
end)
