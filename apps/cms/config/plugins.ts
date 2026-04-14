import type { Core } from '@strapi/strapi';

const config = ({ env }: Core.Config.Shared.ConfigParams): Core.Config.Plugin => ({
  ckeditor: {
    enabled: true,
  },
});

export default config;
