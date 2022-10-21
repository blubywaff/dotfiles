
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Colorschemes
    -- use 'folke/tokyonight.nvim' -- removed because not enough contrast
    use 'romainl/vim-dichromatic'
    use 'b4skyx/serenade'

    -- Plugins
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-context'
    use {'neoclide/coc.nvim', branch='release'}
end)
