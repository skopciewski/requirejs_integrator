({
  paths: {
    jquery: "empty:"
  },
  removeCombined: true,
  // findNestedDependencies: true,
  optimize: 'uglify2',
  skipDirOptimize: true,
  modules: [
    {
      name: 'main'
    },
    // {
    //   name: 'page/podsumowanie',
    //   exclude: ['main']
    // },
  ],
})
