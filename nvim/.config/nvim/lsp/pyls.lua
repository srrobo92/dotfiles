local root_files = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
}
return {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_markers = root_files,
    single_file_support = true,
}
