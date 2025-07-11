plugins: [
  new webpack.ProvidePlugin({
    process: 'process/browser',
  }),
],
resolve: {
  fallback: {
    process: require.resolve('process/browser'),
  },
},