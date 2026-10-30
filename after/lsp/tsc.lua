return {
  capabilities = {
    experimental = {
      hoverVerbosityLevel = true,
    },
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },

  settings = {
    ['js/ts'] = {
      maximumHoverLength = 5000,
      inlayHints = {
        parameterNames = {
          enabled = 'none',
          suppressWhenArgumentMatchesName = true,
        },
        parameterTypes = {
          enabled = false,
        },
        variableTypes = {
          enabled = true,
          suppressWhenTypeMatchesName = false,
        },
        propertyDeclarationTypes = {
          enabled = true,
        },
        functionLikeReturnTypes = {
          enabled = true,
        },
        enumMemberValues = {
          enabled = false,
        },
      },
    },
  },
}
