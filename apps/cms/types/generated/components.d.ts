import type { Schema, Struct } from '@strapi/strapi';

export interface BlocksPhotoCard extends Struct.ComponentSchema {
  collectionName: 'components_blocks_photo_cards';
  info: {
    description: '\u041A\u0430\u0440\u0442\u043E\u0447\u043A\u0430 \u0441 \u0444\u043E\u0442\u043E\u0433\u0440\u0430\u0444\u0438\u0435\u0439';
    displayName: '\u0424\u043E\u0442\u043E-\u043A\u0430\u0440\u0442\u043E\u0447\u043A\u0430';
  };
  attributes: {
    alt: Schema.Attribute.String & Schema.Attribute.DefaultTo<''>;
    photo: Schema.Attribute.Media<'images'> & Schema.Attribute.Required;
  };
}

export interface BlocksPrinciple extends Struct.ComponentSchema {
  collectionName: 'components_blocks_principles';
  info: {
    description: '';
    displayName: '\u041F\u0440\u0438\u043D\u0446\u0438\u043F';
  };
  attributes: {
    badge: Schema.Attribute.String;
    paragraph1: Schema.Attribute.Text;
    paragraph2: Schema.Attribute.Text;
    title: Schema.Attribute.String;
  };
}

export interface BlocksServiceAutoTab extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_auto_tabs';
  info: {
    description: '\u0412\u043A\u043B\u0430\u0434\u043A\u0430 \u0432 \u0431\u043B\u043E\u043A\u0435 \u00AB\u041E\u0431\u044A\u0435\u043A\u0442\u044B \u0430\u0432\u0442\u043E\u043C\u0430\u0442\u0438\u0437\u0430\u0446\u0438\u0438\u00BB';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u0422\u0430\u0431 \u043E\u0431\u044A\u0435\u043A\u0442\u0430 \u0430\u0432\u0442\u043E\u043C\u0430\u0442\u0438\u0437\u0430\u0446\u0438\u0438';
  };
  attributes: {
    buttonHref: Schema.Attribute.String;
    buttonLabel: Schema.Attribute.String;
    challenge: Schema.Attribute.Text;
    feature: Schema.Attribute.Text;
    image: Schema.Attribute.Media<'images'>;
    label: Schema.Attribute.String & Schema.Attribute.Required;
    subtitle: Schema.Attribute.String;
  };
}

export interface BlocksServiceBadge extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_badges';
  info: {
    description: '\u0411\u0435\u0439\u0434\u0436 \u0432 \u0433\u0435\u0440\u043E\u0439-\u0441\u0435\u043A\u0446\u0438\u0438 \u0441\u0442\u0440\u0430\u043D\u0438\u0446\u044B \u0443\u0441\u043B\u0443\u0433\u0438 (\u0438\u043A\u043E\u043D\u043A\u0430 + \u043F\u043E\u0434\u043F\u0438\u0441\u044C)';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u0411\u0435\u0439\u0434\u0436';
  };
  attributes: {
    icon: Schema.Attribute.Media<'images' | 'files'>;
    label: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface BlocksServiceCtaSection extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_cta_sections';
  info: {
    description: '\u0424\u0438\u043D\u0430\u043B\u044C\u043D\u044B\u0439 \u043F\u0440\u0438\u0437\u044B\u0432 \u043A \u0434\u0435\u0439\u0441\u0442\u0432\u0438\u044E';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 CTA';
  };
  attributes: {
    ctaHeading: Schema.Attribute.String;
    ctaHeadingAccent: Schema.Attribute.String;
    ctaImage: Schema.Attribute.Media<'images'>;
    ctaPrimaryButtonHref: Schema.Attribute.String;
    ctaPrimaryButtonLabel: Schema.Attribute.String;
    ctaSubheading: Schema.Attribute.Text;
  };
}

export interface BlocksServiceFeatureCard extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_feature_cards';
  info: {
    description: '\u041A\u0430\u0440\u0442\u043E\u0447\u043A\u0430 \u0442\u0435\u0445\u043D\u0438\u0447\u0435\u0441\u043A\u043E\u0439 \u0432\u043E\u0437\u043C\u043E\u0436\u043D\u043E\u0441\u0442\u0438/\u0444\u0438\u0447\u0438 \u0432 \u0441\u0435\u043A\u0446\u0438\u0438 \u0438\u043D\u0436\u0435\u043D\u0435\u0440\u0438\u0438';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u041A\u0430\u0440\u0442\u043E\u0447\u043A\u0430 \u0444\u0438\u0447\u0438';
  };
  attributes: {
    description: Schema.Attribute.Text;
    icon: Schema.Attribute.Media<'images' | 'files'>;
    title: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface BlocksServiceFeaturesSection extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_features_sections';
  info: {
    description: '\u0411\u043B\u043E\u043A \u0441 \u043A\u0430\u0440\u0442\u043E\u0447\u043A\u0430\u043C\u0438 \u0432\u043E\u0437\u043C\u043E\u0436\u043D\u043E\u0441\u0442\u0435\u0439/\u0444\u0438\u0447';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u0412\u043E\u0437\u043C\u043E\u0436\u043D\u043E\u0441\u0442\u0438';
  };
  attributes: {
    featureCards: Schema.Attribute.Component<
      'blocks.service-feature-card',
      true
    >;
    featuresTitle: Schema.Attribute.String;
    featuresTitleAccent: Schema.Attribute.String;
  };
}

export interface BlocksServiceHeroSection extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_hero_sections';
  info: {
    description: '\u0413\u043B\u0430\u0432\u043D\u044B\u0439 \u044D\u043A\u0440\u0430\u043D \u0441\u0442\u0440\u0430\u043D\u0438\u0446\u044B \u0443\u0441\u043B\u0443\u0433\u0438';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 Hero';
  };
  attributes: {
    heroBadges: Schema.Attribute.Component<'blocks.service-badge', true>;
    heroDescription: Schema.Attribute.Text;
    heroEyebrow: Schema.Attribute.String & Schema.Attribute.Required;
    heroHeading: Schema.Attribute.String;
    heroHeadingAccent: Schema.Attribute.String &
      Schema.Attribute.SetPluginOptions<{
        'content-manager': {
          visible: false;
        };
      }>;
    heroPrimaryButtonHref: Schema.Attribute.String;
    heroPrimaryButtonLabel: Schema.Attribute.String;
    heroSecondaryButtonLabel: Schema.Attribute.String &
      Schema.Attribute.DefaultTo<'\u041F\u043E\u0434\u0440\u043E\u0431\u043D\u0435\u0435'>;
  };
}

export interface BlocksServiceLogicSlide extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_logic_slides';
  info: {
    description: '\u0421\u043B\u0430\u0439\u0434 \u0432 \u0431\u043B\u043E\u043A\u0435 \u00AB\u0418\u043D\u0436\u0435\u043D\u0435\u0440\u043D\u0430\u044F \u043B\u043E\u0433\u0438\u043A\u0430\u00BB';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u0421\u043B\u0430\u0439\u0434 \u043B\u043E\u0433\u0438\u043A\u0438';
  };
  attributes: {
    buttonHref: Schema.Attribute.String;
    buttonLabel: Schema.Attribute.String;
    description: Schema.Attribute.Text;
    image: Schema.Attribute.Media<'images'>;
    title: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface BlocksServiceProblemItem extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_problem_items';
  info: {
    description: '\u042D\u043B\u0435\u043C\u0435\u043D\u0442 \u0441\u0435\u043A\u0446\u0438\u0438 \u00AB\u041F\u043E\u0447\u0435\u043C\u0443 X \u043D\u0435 \u0440\u0430\u0431\u043E\u0442\u0430\u0435\u0442\u00BB';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u041F\u0440\u043E\u0431\u043B\u0435\u043C\u0430';
  };
  attributes: {
    description: Schema.Attribute.Text;
    title: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface BlocksServiceProblemSection extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_problem_sections';
  info: {
    description: '\u0411\u043B\u043E\u043A \u0441 \u043F\u0440\u043E\u0431\u043B\u0435\u043C\u0430\u043C\u0438 \u043A\u043B\u0438\u0435\u043D\u0442\u0430 (\u043A\u043E\u043B\u0435\u0441\u043E)';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u041F\u0440\u043E\u0431\u043B\u0435\u043C\u0430\u0442\u0438\u043A\u0430';
  };
  attributes: {
    problemIcon: Schema.Attribute.Media<'images' | 'files'>;
    problemItems: Schema.Attribute.Component<
      'blocks.service-problem-item',
      true
    >;
    problemTitle: Schema.Attribute.String;
    problemTitleAccent: Schema.Attribute.String;
  };
}

export interface BlocksServiceRecognizeCard extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_recognize_cards';
  info: {
    description: '\u041A\u0430\u0440\u0442\u043E\u0447\u043A\u0430 \u0433\u043E\u0440\u0438\u0437\u043E\u043D\u0442\u0430\u043B\u044C\u043D\u043E\u0433\u043E \u0441\u043A\u0440\u043E\u043B\u043B\u0430 \u0441 \u0440\u0430\u0441\u043A\u0440\u044B\u0442\u0438\u0435\u043C \u043F\u043E hover';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u041A\u0430\u0440\u0442\u043E\u0447\u043A\u0430 \u00AB\u0412\u044B \u0443\u0437\u043D\u0430\u0451\u0442\u0435 \u0441\u0432\u043E\u0439 \u0431\u0438\u0437\u043D\u0435\u0441\u00BB';
  };
  attributes: {
    description: Schema.Attribute.Text;
    feature: Schema.Attribute.Text;
    image: Schema.Attribute.Media<'images'>;
    title: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface BlocksServiceRecognizeSection extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_recognize_sections';
  info: {
    description: '\u0413\u043E\u0440\u0438\u0437\u043E\u043D\u0442\u0430\u043B\u044C\u043D\u044B\u0439 \u0441\u043A\u0440\u043E\u043B\u043B \u0441 \u0440\u0430\u0441\u043A\u0440\u044B\u0432\u0430\u044E\u0449\u0438\u043C\u0438\u0441\u044F \u043A\u0430\u0440\u0442\u043E\u0447\u043A\u0430\u043C\u0438';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u0412\u044B \u0443\u0437\u043D\u0430\u0451\u0442\u0435 \u0441\u0432\u043E\u0439 \u0431\u0438\u0437\u043D\u0435\u0441';
  };
  attributes: {
    recognizeCards: Schema.Attribute.Component<
      'blocks.service-recognize-card',
      true
    >;
    recognizeTitle: Schema.Attribute.String;
  };
}

export interface BlocksServiceStatRow extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_stat_rows';
  info: {
    description: '\u0421\u0442\u0440\u043E\u043A\u0430 \u0441\u0440\u0430\u0432\u043D\u0438\u0442\u0435\u043B\u044C\u043D\u043E\u0439 \u0442\u0430\u0431\u043B\u0438\u0446\u044B \u0432 \u0441\u0435\u043A\u0446\u0438\u0438 \u00AB\u0426\u0435\u043D\u043D\u043E\u0441\u0442\u044C \u0432 \u0446\u0438\u0444\u0440\u0430\u0445\u00BB';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u0421\u0442\u0440\u043E\u043A\u0430 \u0441\u0442\u0430\u0442\u0438\u0441\u0442\u0438\u043A\u0438';
  };
  attributes: {
    label: Schema.Attribute.String & Schema.Attribute.Required;
    valueAfter: Schema.Attribute.String;
    valueBefore: Schema.Attribute.String;
  };
}

export interface BlocksServiceStatsSection extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_stats_sections';
  info: {
    description: '\u0422\u0430\u0431\u043B\u0438\u0446\u0430 \u0441\u0440\u0430\u0432\u043D\u0435\u043D\u0438\u044F \u043F\u043E\u043A\u0430\u0437\u0430\u0442\u0435\u043B\u0435\u0439 \u0434\u043E \u0438 \u043F\u043E\u0441\u043B\u0435';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u0411\u044B\u043B\u043E/\u0421\u0442\u0430\u043B\u043E';
  };
  attributes: {
    statsColAfter: Schema.Attribute.String;
    statsColBefore: Schema.Attribute.String;
    statsRows: Schema.Attribute.Component<'blocks.service-stat-row', true>;
    statsTitle: Schema.Attribute.String;
  };
}

export interface BlocksServiceTab extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_tabs';
  info: {
    description: '\u0422\u0430\u0431 \u0432 \u0431\u043B\u043E\u043A\u0435 \u00AB\u041E\u0431\u044A\u0435\u043A\u0442\u044B \u0430\u0432\u0442\u043E\u043C\u0430\u0442\u0438\u0437\u0430\u0446\u0438\u0438\u00BB \u043D\u0430 \u0441\u0442\u0440\u0430\u043D\u0438\u0446\u0435 ERP';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u0422\u0430\u0431 (ERP)';
  };
  attributes: {
    content: Schema.Attribute.Text;
    label: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface BlocksServiceTargetCard extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_target_cards';
  info: {
    description: '\u041A\u0430\u0440\u0442\u043E\u0447\u043A\u0430 \u0446\u0435\u043B\u0435\u0432\u043E\u0439 \u0430\u0443\u0434\u0438\u0442\u043E\u0440\u0438\u0438 \u0432 \u0441\u0435\u043A\u0446\u0438\u0438 \u00AB\u0414\u043B\u044F \u043A\u043E\u0433\u043E \u044D\u0442\u043E \u0440\u0435\u0448\u0435\u043D\u0438\u0435\u00BB';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u041A\u0430\u0440\u0442\u043E\u0447\u043A\u0430 \u00AB\u0414\u043B\u044F \u043A\u043E\u0433\u043E\u00BB';
  };
  attributes: {
    challenge: Schema.Attribute.Text;
    feature: Schema.Attribute.Text;
    tag: Schema.Attribute.String;
    title: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface BlocksServiceTargetSection extends Struct.ComponentSchema {
  collectionName: 'components_blocks_service_target_sections';
  info: {
    description: '\u0411\u043B\u043E\u043A \u0446\u0435\u043B\u0435\u0432\u043E\u0439 \u0430\u0443\u0434\u0438\u0442\u043E\u0440\u0438\u0438 (\u043A\u0430\u0440\u0442\u043E\u0447\u043A\u0438)';
    displayName: '\u0421\u0435\u0440\u0432\u0438\u0441 \u2014 \u0414\u043B\u044F \u043A\u043E\u0433\u043E';
  };
  attributes: {
    targetButtonHref: Schema.Attribute.String;
    targetButtonLabel: Schema.Attribute.String;
    targetCards: Schema.Attribute.Component<'blocks.service-target-card', true>;
    targetTitle: Schema.Attribute.String;
  };
}

export interface BlocksStatCard extends Struct.ComponentSchema {
  collectionName: 'components_blocks_stat_cards';
  info: {
    description: '\u041A\u0430\u0440\u0442\u043E\u0447\u043A\u0430 \u0441 \u0446\u0438\u0444\u0440\u043E\u0439, \u043F\u043E\u0434\u043F\u0438\u0441\u044C\u044E \u0438 \u0444\u043E\u043D\u043E\u0432\u044B\u043C \u0438\u0437\u043E\u0431\u0440\u0430\u0436\u0435\u043D\u0438\u0435\u043C';
    displayName: '\u041A\u0430\u0440\u0442\u043E\u0447\u043A\u0430-\u043F\u043E\u043A\u0430\u0437\u0430\u0442\u0435\u043B\u044C';
  };
  attributes: {
    backgroundImage: Schema.Attribute.Media<'images'>;
    label: Schema.Attribute.String & Schema.Attribute.Required;
    value: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

declare module '@strapi/strapi' {
  export module Public {
    export interface ComponentSchemas {
      'blocks.photo-card': BlocksPhotoCard;
      'blocks.principle': BlocksPrinciple;
      'blocks.service-auto-tab': BlocksServiceAutoTab;
      'blocks.service-badge': BlocksServiceBadge;
      'blocks.service-cta-section': BlocksServiceCtaSection;
      'blocks.service-feature-card': BlocksServiceFeatureCard;
      'blocks.service-features-section': BlocksServiceFeaturesSection;
      'blocks.service-hero-section': BlocksServiceHeroSection;
      'blocks.service-logic-slide': BlocksServiceLogicSlide;
      'blocks.service-problem-item': BlocksServiceProblemItem;
      'blocks.service-problem-section': BlocksServiceProblemSection;
      'blocks.service-recognize-card': BlocksServiceRecognizeCard;
      'blocks.service-recognize-section': BlocksServiceRecognizeSection;
      'blocks.service-stat-row': BlocksServiceStatRow;
      'blocks.service-stats-section': BlocksServiceStatsSection;
      'blocks.service-tab': BlocksServiceTab;
      'blocks.service-target-card': BlocksServiceTargetCard;
      'blocks.service-target-section': BlocksServiceTargetSection;
      'blocks.stat-card': BlocksStatCard;
    }
  }
}
