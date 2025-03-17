local root_files = { 
    'verible.filelist',
}
return {
    cmd = { "verible-verilog-ls" },
    filetypes = { "systemverilog", "verilog" },
    root_markers = root_files,
}
