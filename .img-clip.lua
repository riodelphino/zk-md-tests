-- Per-project config for 'img-clip.nvim'
return {
  defaults = {
    dir_path = 'assets', -- Save to `assets` dir
  },
  filetypes = {
    markdown = {
      formats = { 'jpeg', 'jpg', 'png', 'gif', 'webp', 'avif', 'pdf' }, -- TODO: Avoid PDF to be resized
      template = '![$FILE_NAME_NO_EXT]($FILE_PATH)',
      dir_path = function()                                             -- Save to `assets/{zk_id}` dir (e.g. `assets/b9iuae`)
        local md_path = vim.api.nvim_buf_get_name(0)
        local md_basename = vim.fn.fnamemodify(md_path, ':t:r')
        return vim.fs.joinpath('assets', md_basename)
      end,
      file_name = '%Y%m%d-%H%M%S',                                -- Datetime (e.g. `20251101-122015.jpg`)
      download_images = true,                                     -- Download images from url
      copy_images = true,                                         -- Copy local images to assets dir
      relative_to_current_file = false,                           -- Relative to the root dir
      relative_template_path = false,                             -- Use relative to cwd, not to current file
      process_cmd = 'convert - -resize 800x800\\> -quality 90 -', -- Resize to within 800x800
    },
  },
}
