return {
    {
        "nvzone/timerly",
        lazy = true,
        dependencies = 'nvzone/volt',
        cmd = "TimerlyToggle",
        opts = {} -- optional
    },
    {
        "nvzone/showkeys",
        lazy = true,
        cmd = "ShowkeysToggle",
        opts = {
            position = "bottom-right",
            show_count = true,
        },
    },
    {
        "nvzone/typr",
        lazy = true,
        dependencies = "nvzone/volt",
        opts = {},
        cmd = { "Typr", "TyprStats" },
    }
}
