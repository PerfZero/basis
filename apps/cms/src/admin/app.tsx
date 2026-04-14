import type { StrapiApp } from '@strapi/strapi/admin';

export default {
  config: {
    // CKEditor plugin currently ships only en.json translations.
    // Keeping unsupported locale here causes admin white screen on load.
    locales: ['en'],
  },
  bootstrap(_app: StrapiApp) {},
};
