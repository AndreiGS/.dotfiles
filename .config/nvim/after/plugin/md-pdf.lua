require('md-pdf').setup({
    --- Set margins around document
    margins = "1.5cm",
    -- tango, pygments are quite nice for white on white
    highlight = "tango",
    -- Generate a table of contents, on by default
    toc = true,
    preview_cmd = function() return 'brave' end,
    ignore_viewer_state = false,
    fonts = {
        main_font = "UTSans",
        sans_font = "UTSans",
        mono_font = "IosevkaTerm Nerd Font Mono",
        math_font = nil,
    },
})

-- setup mapping
vim.keymap.set("n", "<Space>,", function()
    require('md-pdf').convert_md_to_pdf()
end)
