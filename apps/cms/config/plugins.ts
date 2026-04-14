import type { Core } from '@strapi/strapi';

const config = ({ env: _env }: Core.Config.Shared.ConfigParams): Core.Config.Plugin => ({
  tinymce: {
    enabled: true,
  },
});

export default config;
