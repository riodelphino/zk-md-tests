-- Per-project config for 'img-clip.nvim'

return {
  defaults = {
    dir_path = 'assets',
    formats = { 'jpeg', 'jpg', 'png' },
  },
  filetypes = {
    markdown = {
      template = '![$FILE_NAME_NO_EXT]($FILE_PATH)',
      file_name = '%Y%m%d-%H%M%S',
      download_images = true, -- download images from url
      copy_images = true,     -- copy local images to assets dir
      -- use_absolute_path = false,
      -- relative_to_current_file = false,
    },
  },
}

-- TODO: Use 'assets/{id}' dir to store images
-- (e.g.)
--    'assets/a9ikue'

-- TODO: Resize when large image
-- (e.g.)
--    process_cmd = "convert - -quality 85 -" -- compress the image with 85% quality
--    process_cmd = "convert - -resize 50% -" -- resize the image to 50% of its original size

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
