require("neodev").setup({})

local lsp = require("lsp-zero")
local nvim_lsp = require("lspconfig")

lsp.preset("recommended")

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'tsserver', 'rust_analyzer', 'kotlin_language_server'},
  handlers = {
    function(server_name)
      nvim_lsp[server_name].setup({})
    end,
  },
})

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end, opts)
end

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.on_attach(on_attach)

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        checkThirdParty = false,
      }
    },
  }
})

vim.diagnostic.config({
  virtual_text = true
})

lsp.setup()

--- Typescript lsp config ---
nvim_lsp["tsserver"].setup {
  on_attach = on_attach,
  autostart = true,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}

--- Kotlin lsp config ---
nvim_lsp["kotlin_language_server"].setup({
  on_attach = on_attach,
  -- cmd = { "/Users/andreighiurtu/DevTools/kotlin-language-server/server/build/install/server/bin/kotlin-language-server" }
})

--- Flutter Tools lsp config ---
local dart_lsp = lsp.build_options('dartls', {})

require("flutter-tools").setup {
  ui = {
    border = "rounded",
  },
  decorations = {
    statusline = {
      app_version = false,
      device = false,
      project_config = false,
    }
  },
  debugger = {
    enabled = true,
    run_via_dap = true,   -- use dap instead of a plenary job to run flutter apps
    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
    -- see |:help dap.set_exception_breakpoints()| for more info
    exception_breakpoints = {},
    register_configurations = function()
      require("dap").configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Flutter",
          flutterMode = "debug",
          program = "lib/main.dart",
          cwd = vim.fn.getcwd(),
        },
      }
    end,
  },
  flutter_path = "/Users/andreighiurtu/DevPack/flutter/bin",   -- example "dirname $(which flutter)" or "asdf where flutter"
  fvm = false,                                       -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  widget_guides = {
    enabled = false,
  },
  closing_tags = {
    highlight = "VerSplit",   -- highlight for the closing tag
    prefix = "//",             -- character to use for close tag e.g. > Widget
    enabled = true            -- set to false to disable
  },
  dev_log = {
    enabled = true,
    notify_errors = true,   -- if there is an error whilst running then notify the user
    open_cmd = "tabedit",    -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = false,           -- autostart devtools server if not detected
    auto_open_browser = false,   -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "30vnew",   -- command to use to open the outline buffer
    auto_open = false      -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    cmd = { "dart", "/Users/andreighiurtu/DevPack/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },
    on_attach = on_attach,
    capabilities = dart_lsp.capabilities,
    color = {
      -- show the derived colours for dart variables
      enabled = false,          -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false,       -- highlight the background
      background_color = nil,   -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false,       -- highlight the foreground
      virtual_text = true,      -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      renameFilesWithClasses = "always",
      enableSnippets = true,
      updateImportsOnRename = true,   -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
    }
  }
}
