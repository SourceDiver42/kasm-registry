/** @type {import('next').NextConfig} */

const nextConfig = {
  output: 'export',
  distDir: '../public',
  env: {
    name: 'SourceDiver42 Kasm Registry',
    description: 'Contains various Kasm workspaces, mostly related to cybersecurity.',
    icon: '/img/logo.svg',
    listUrl: 'https://sourcediver42.github.io/kasm-registry/',
    contactUrl: 'https://github.com/SourceDiver42/kasm-registry/issues',
  },
  reactStrictMode: true,
  basePath: '/kasm-registry/1.0',
  trailingSlash: true,
  images: {
    unoptimized: true,
  }
}

module.exports = nextConfig
