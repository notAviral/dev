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
