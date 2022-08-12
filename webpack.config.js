const path = require("path");
const WebpackAssetsManifest = require("webpack-assets-manifest");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const glob = require("glob");
const webpack = require('webpack');

const { NODE_ENV } = process.env;
const isProd = NODE_ENV === "production";

const entries = {};
glob.sync("app/javascript/packs/*.js").forEach((filePath) => {
  const name = path.basename(filePath, path.extname(filePath));
  entries[name] = path.resolve(__dirname, filePath);
});

module.exports = {
  mode: isProd ? "production" : "development",
  devtool: "source-map",
  entry: entries,
  output: {
    path: path.resolve(__dirname, "public/packs"),
    publicPath: isProd ? "/packs/" : "//localhost:8081/packs/",
    filename: isProd ? "[name]-[hash].js" : "[name].js",
  },
  resolve: {
    extensions: [".js"],
  },
  module: {
    rules: [
      {
        test: /\.(sass|scss|css)$/,
        use: [MiniCssExtractPlugin.loader, "css-loader", "sass-loader"]
      }
    ]
  },
  devServer: {
      static: {
        directory: path.resolve(__dirname, "public"),
        publicPath: "/packs/",
      },
      host: "0.0.0.0",
      port: 8081,
    },
  plugins: [
    new WebpackAssetsManifest({
      publicPath: true,
      output: "manifest.json",
    }),
    new MiniCssExtractPlugin({
      filename: isProd ? "[name]-[hash].css" : "[name].css",
    }),
  ],
};
