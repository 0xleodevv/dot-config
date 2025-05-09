return {

	cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
	filetypes = { "solidity" },
	root_makers = {
		"hardhat.config.js",
		"hardhat.config.ts",
		"foundry.toml",
		"remappings.txt",
		".git",
		"package.json",
	},
	single_file_support = true,
}
