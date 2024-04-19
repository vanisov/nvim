local os = vim.loop.os_uname().sysname

local build_script

if os == "Darwin" then
	-- macOS
	build_script = "sh install.sh npm"
elseif os == "Windows_NT" then
	-- Windows
	build_script = "pwsh install.ps1 npm"
else
	-- Handle other operating systems if needed
	error("Unsupported operating system: " .. os)
end

local plugins = {
	{
		"barrett-ruth/import-cost.nvim",
		build = build_script,
		config = true,
	},
}

return plugins
