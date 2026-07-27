return {
    {
        "kristijanhusak/vim-dadbod-ui",
        ft = { 'sql', 'plsql', 'mysql' },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        depedencies = {
            "tpope/vim-dadbod",
            "kristijanhusak/vim-dadbod-completion",
        },
    },
}
