local root_files = { 
    'verible.filelist',
}
return {
    cmd = { "verible-verilog-ls", "--rules_config=~/.config/nvim/lsp/" },
    filetypes = { "systemverilog", "verilog" },
    root_markers = root_files,
}
