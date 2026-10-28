return {
  settings = {
    rulesCustomizations = {
      {
        rule = '@typescript-eslint/no-unused-vars',
        severity = 'off', --I'm letting it the ts_ls handle this errors
        --severity = 'warn',
      },
      {
        rule = 'no-unused-vars',
        severity = 'off',
        --severity = 'warn',
      },
    },
  },
}
