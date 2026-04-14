import type { Core } from '@strapi/strapi';

const config: Core.Config.Middlewares = [
  'strapi::logger',
  'strapi::errors',
  {
    name: 'strapi::security',
    config: {
      contentSecurityPolicy: {
        useDefaults: true,
        directives: {
          'script-src': ["'self'", "'unsafe-inline'", 'cdnjs.cloudflare.com', 'cdn.tiny.cloud'],
          'script-src-elem': ["'self'", "'unsafe-inline'", 'cdnjs.cloudflare.com', 'cdn.tiny.cloud'],
          'style-src': ["'self'", "'unsafe-inline'", 'cdn.tiny.cloud'],
          'font-src': ["'self'", 'cdn.tiny.cloud', 'data:'],
          'img-src': [
            "'self'",
            'data:',
            'blob:',
            'dl.airtable.com',
            'res.cloudinary.com',
            'cdn.tiny.cloud',
            'https://cms.basis.devdenis.ru',
            'https://cms.basisthree.ru',
            'http://localhost:1337',
          ],
          upgradeInsecureRequests: null,
        },
      },
    },
  },
  'strapi::cors',
  'strapi::poweredBy',
  'strapi::query',
  'strapi::body',
  'strapi::session',
  'strapi::favicon',
  'strapi::public',
];

export default config;
