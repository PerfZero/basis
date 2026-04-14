import type { StrapiApp } from '@strapi/strapi/admin';
import './styles.css';

export default {
  config: {
    locales: ['ru'],
  },
  bootstrap(_app: StrapiApp) {},
};
