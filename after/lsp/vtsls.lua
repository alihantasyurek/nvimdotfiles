return {
  settings = {
    typescript = {
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
          enabled = true,
        },
      },
    },
  },
}
