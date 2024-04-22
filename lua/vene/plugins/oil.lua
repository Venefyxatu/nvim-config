-- File explorer

return {
    "stevearc/oil.nvim",
    opts = {
        columns = {
            "icon",
            "permissions",
            "size",
            "mtime",
        },
        constrain_cursor = "name",
        delete_to_trash = true,
        view_options = {
            show_hidden = true,
        },
        float = {
            border = "rounded",
        },
    },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
}
