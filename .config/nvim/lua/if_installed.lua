-- requires named plugin and only calls setup function if successful. Allows me
-- to pull down my config and run neovim without having to worry about installed
-- plugins.
-- 
-- Usage:
-- require("if_installed")("my_plugin", function(my_plugin)
-- 	my_plugin.setup()
-- end)
return function(plugin_name, setup_fn)
	local ok, plugin = pcall(require, plugin_name)

	if not ok then
		return
	end

	setup_fn(plugin)
end
