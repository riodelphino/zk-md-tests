-- Per-project config for 'img-clip.nvim'

return {
  defaults = {
    dir_path = 'assets', -- Save to `assets` dir
  },
  dirs = {
    [''] = {
      formats = { 'jpeg', 'jpg', 'png', 'webp', 'avif', 'pdf' },
      template = '![$FILE_NAME_NO_EXT]($FILE_PATH)',
      dir_path = function() -- Save to `assets/{zk_id}` dir (e.g. `assets/b9iuae`)
        local md_path = vim.api.nvim_buf_get_name(0)
        local md_basename = vim.fn.fnamemodify(md_path, ':t:r')
        return vim.fs.joinpath('assets', md_basename)
      end,
      file_name = '%Y%m%d-%H%M%S',    -- datetime (e.g. `20251101-122015.jpg`)
      download_images = true,         -- download images from url
      copy_images = true,             -- copy local images to assets dir
      relative_to_current_file = false,
      relative_template_path = false, -- Use relative to cwd, not to current file
      -- process_cmd = 'convert - -resize 800x800\\> -quality 90 -', -- Resize to within 800x800

      -- process_cmd = function(arg) -- NOT WORKS
      --   print('arg: ' .. vim.inspect(arg))
      -- end,

      -- NOTE: `filetype` option insists `markdown` `vimwiki` `typst` e.t.c. / NOT `jpg` `png` `pdf`
    },
  },
}

-- NOTE: A TEST for renaming (Valid only in 'template'. Actual filename is formatted with 'file_name' option)
-- template = function(context)
--   local function encode(path)
--     -- return path:gsub('([^A-Za-z0-9._~-])', function(c) -- Encode all special chars
--     return path:gsub('([ ])', function(c) -- Encode only spaces
--       return string.format('%%%02X', string.byte(c))
--     end)
--   end
--   local notebook_path = require('zk.util').notebook_root(context.file_path)
--   local root = notebook_path or vim.fn.getcwd()
--   local abs_path = vim.uv.fs_realpath(context.file_path)
--   local rel_path = abs_path -- fallback
--   if abs_path:sub(1, #root) == root then
--     rel_path = abs_path:sub(#root + 2)
--   end
--   local encoded_path = encode(rel_path)
--   local ret = '![$FILE_NAME_NO_EXT$CURSOR](' .. encoded_path .. ')'
--   return ret
-- end,
