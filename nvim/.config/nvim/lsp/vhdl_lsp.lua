local root_files = {
    'vhdl_ls.toml',
    '.vhdl_ls.toml',
}
return {
    cmd = { "vhdl_ls" },
    filetypes = { "vhdl", "vhd" },
    root_markers = root_files,
    single_file_support = true,
}
