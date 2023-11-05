# My NeoVim Configuration

Packages are managed by [Packer](https://github.com/wbthomason/packer.nvim),
see [plugins](./lua/plugins.lua).

The presence of each plugin is checked during the `register` phase and
configured during the `configure` phase (see [init.lua](./init.lua)).
