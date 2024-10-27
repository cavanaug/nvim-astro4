-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
    {
        "goolord/alpha-nvim",
        -- the first parameter is the plugin specification
        -- the second is the table of options as set up in Lazy with the `opts` key
        opts = function(_, opts)
            -- customize the dashboard header
            opts.section.header.val = {
                "                                                                       ",
                "                                                                     ",
                "       ████ ██████           █████      ██                     ",
                "      ███████████             █████                             ",
                "      █████████ ███████████████████ ███   ███████████   ",
                "     █████████  ███    █████████████ █████ ██████████████   ",
                "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
                "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
                " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
                "                                                                       ",
            }
            return opts
        end,
    },
}
