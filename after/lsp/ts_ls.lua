return {
  root_markers = {
    'tsconfig.json',
    'jsconfig.json',
    'package.json',
    '.git',
  },
  init_options = {
    hostInfo = 'neovim',
    preferences = {
      includeInlayParameterNameHints = 'all',
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = false,
      includeInlayVariableTypeHints = false,
      includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  },
  settings = {
    implicitProjectConfiguration = {
      checkJs = true,
      module = 'nodenext',
      -- module = 'esnext',
      -- module = 'commonjs',
      target = 'es2022',
    },

    typescript = {
      preferences = {
        includePackageJsonAutoImports = 'on',
      },
    },

    javascript = {
      preferences = {
        includePackageJsonAutoImports = 'on',
      },
    },
  },
}
