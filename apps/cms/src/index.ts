import type { Core } from "@strapi/strapi";

const heroBlockLabels = {
  uid: "api::hero-block.hero-block",
  settings: {
    bulkable: true,
    filterable: true,
    searchable: true,
    pageSize: 10,
    mainField: "eyebrow",
    defaultSortBy: "eyebrow",
    defaultSortOrder: "ASC",
  },
  metadatas: {
    id: {
      edit: {},
      list: { label: "ID", searchable: true, sortable: true },
    },
    eyebrow: {
      edit: {
        label: "Надпись над заголовком",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: {
        label: "Надпись над заголовком",
        searchable: true,
        sortable: true,
      },
    },
    heading: {
      edit: {
        label: "Заголовок (акцент оборачивай в [скобки])",
        description: "",
        placeholder: "Строим системы, которые [Увеличивают] Маржинальность",
        visible: true,
        editable: true,
      },
      list: { label: "Заголовок", searchable: true, sortable: true },
    },
    description: {
      edit: {
        label: "Описание",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Описание", searchable: true, sortable: true },
    },
    primaryButtonLabel: {
      edit: {
        label: "Кнопка 1 — текст",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Кнопка 1 — текст", searchable: true, sortable: true },
    },
    primaryButtonHref: {
      edit: {
        label: "Кнопка 1 — ссылка",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Кнопка 1 — ссылка", searchable: true, sortable: true },
    },
    secondaryButtonLabel: {
      edit: {
        label: "Кнопка 2 — текст",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Кнопка 2 — текст", searchable: true, sortable: true },
    },
    secondaryButtonHref: {
      edit: {
        label: "Кнопка 2 — ссылка",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Кнопка 2 — ссылка", searchable: true, sortable: true },
    },
  },
  layouts: {
    list: ["id", "eyebrow"],
    edit: [
      [{ name: "eyebrow", size: 12 }],
      [{ name: "heading", size: 12 }],
      [{ name: "description", size: 12 }],
      [
        { name: "primaryButtonLabel", size: 6 },
        { name: "primaryButtonHref", size: 6 },
      ],
      [
        { name: "secondaryButtonLabel", size: 6 },
        { name: "secondaryButtonHref", size: 6 },
      ],
    ],
  },
};

const menuServiceLabels = {
  uid: "api::menu-service.menu-service",
  settings: {
    bulkable: true,
    filterable: true,
    searchable: true,
    pageSize: 10,
    mainField: "title",
    defaultSortBy: "sortOrder",
    defaultSortOrder: "ASC",
  },
  metadatas: {
    id: {
      edit: {},
      list: { label: "ID", searchable: true, sortable: true },
    },
    title: {
      edit: {
        label: "Название",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Название", searchable: true, sortable: true },
    },
    slug: {
      edit: {
        label: "Адрес страницы (URL)",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Адрес страницы", searchable: true, sortable: true },
    },
    link: {
      edit: {
        label: "Ссылка",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Ссылка", searchable: true, sortable: true },
    },
    sortOrder: {
      edit: {
        label: "Порядок сортировки",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Порядок", searchable: true, sortable: true },
    },
    isActive: {
      edit: {
        label: "Активен",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Активен", searchable: true, sortable: true },
    },
  },
  layouts: {
    list: ["id", "title", "sortOrder", "isActive"],
    edit: [
      [
        { name: "title", size: 6 },
        { name: "slug", size: 6 },
      ],
      [
        { name: "link", size: 6 },
        { name: "sortOrder", size: 3 },
        { name: "isActive", size: 3 },
      ],
    ],
  },
};

const statsBlockLabels = {
  uid: "api::stats-block.stats-block",
  settings: {
    bulkable: true,
    filterable: true,
    searchable: true,
    pageSize: 10,
    mainField: "id",
    defaultSortBy: "id",
    defaultSortOrder: "ASC",
  },
  metadatas: {
    id: {
      edit: {},
      list: { label: "ID", searchable: true, sortable: true },
    },
    cards: {
      edit: {
        label: "Карточки",
        description:
          "Добавляй фото-карточки и карточки-показатели в нужном порядке",
        visible: true,
        editable: true,
      },
      list: { label: "Карточки", searchable: false, sortable: false },
    },
  },
  layouts: {
    list: ["id"],
    edit: [[{ name: "cards", size: 12 }]],
  },
};

const teamMemberLabels = {
  uid: "api::team-member.team-member",
  settings: {
    bulkable: true,
    filterable: true,
    searchable: true,
    pageSize: 10,
    mainField: "name",
    defaultSortBy: "sortOrder",
    defaultSortOrder: "ASC",
  },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: true, sortable: true } },
    name: {
      edit: {
        label: "Имя",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Имя", searchable: true, sortable: true },
    },
    role: {
      edit: {
        label: "Роль / направление",
        description: "",
        placeholder: "Продажи и стратегия",
        visible: true,
        editable: true,
      },
      list: { label: "Роль", searchable: true, sortable: true },
    },
    description: {
      edit: {
        label: "Короткое описание",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Описание", searchable: true, sortable: false },
    },
    phone: {
      edit: {
        label: "Телефон",
        description: "",
        placeholder: "+7 999 123 45 67",
        visible: true,
        editable: true,
      },
      list: { label: "Телефон", searchable: true, sortable: false },
    },
    email: {
      edit: {
        label: "Email",
        description: "",
        placeholder: "name@basisthree.ru",
        visible: true,
        editable: true,
      },
      list: { label: "Email", searchable: true, sortable: false },
    },
    contactHandle: {
      edit: {
        label: "Ник / ссылка",
        description: "Например: @ddvworks",
        placeholder: "@username",
        visible: true,
        editable: true,
      },
      list: { label: "Ник", searchable: true, sortable: false },
    },
    photo: {
      edit: {
        label: "Фото",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Фото", searchable: false, sortable: false },
    },
    qrCode: {
      edit: {
        label: "QR-код",
        description: "Изображение QR для контакта сотрудника",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "QR-код", searchable: false, sortable: false },
    },
    sortOrder: {
      edit: {
        label: "Порядок",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Порядок", searchable: false, sortable: true },
    },
  },
  layouts: {
    list: ["id", "name", "role", "phone", "email", "sortOrder"],
    edit: [
      [
        { name: "name", size: 6 },
        { name: "role", size: 6 },
      ],
      [{ name: "description", size: 12 }],
      [
        { name: "phone", size: 4 },
        { name: "email", size: 4 },
        { name: "contactHandle", size: 4 },
      ],
      [
        { name: "photo", size: 4 },
        { name: "qrCode", size: 4 },
        { name: "sortOrder", size: 4 },
      ],
    ],
  },
};

const teamSectionLabels = {
  uid: "api::team-section.team-section",
  settings: {
    bulkable: true,
    filterable: true,
    searchable: true,
    pageSize: 10,
    mainField: "heading",
    defaultSortBy: "heading",
    defaultSortOrder: "ASC",
  },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: true, sortable: true } },
    heading: {
      edit: {
        label: "Заголовок секции",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Заголовок", searchable: true, sortable: true },
    },
    subheading: {
      edit: {
        label: "Подзаголовок / описание",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Подзаголовок", searchable: true, sortable: false },
    },
  },
  layouts: {
    list: ["id", "heading"],
    edit: [[{ name: "heading", size: 12 }], [{ name: "subheading", size: 12 }]],
  },
};

const diagCtaLabels = {
  uid: "api::diag-cta.diag-cta",
  settings: {
    bulkable: true,
    filterable: true,
    searchable: true,
    pageSize: 10,
    mainField: "heading",
    defaultSortBy: "heading",
    defaultSortOrder: "ASC",
  },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: true, sortable: true } },
    heading: {
      edit: {
        label: "Заголовок (акцент в [скобках])",
        description: "",
        placeholder: "Диагностика [ВАШИХ] Бизнес-Процессов",
        visible: true,
        editable: true,
      },
      list: { label: "Заголовок", searchable: true, sortable: true },
    },
    subheading: {
      edit: {
        label: "Подзаголовок",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Подзаголовок", searchable: true, sortable: false },
    },
    buttonLabel: {
      edit: {
        label: "Текст кнопки",
        description: "",
        placeholder: "Начать диагностику",
        visible: true,
        editable: true,
      },
      list: { label: "Кнопка", searchable: false, sortable: false },
    },
    buttonHref: {
      edit: {
        label: "Ссылка кнопки",
        description: "",
        placeholder: "#contact",
        visible: true,
        editable: true,
      },
      list: { label: "Ссылка", searchable: false, sortable: false },
    },
    image: {
      edit: {
        label: "Изображение",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Изображение", searchable: false, sortable: false },
    },
  },
  layouts: {
    list: ["id", "heading"],
    edit: [
      [{ name: "heading", size: 12 }],
      [{ name: "subheading", size: 12 }],
      [
        { name: "buttonLabel", size: 6 },
        { name: "buttonHref", size: 6 },
      ],
      [{ name: "image", size: 12 }],
    ],
  },
};

const servicesSectionLabels = {
  uid: "api::services-section.services-section",
  settings: {
    bulkable: true,
    filterable: true,
    searchable: true,
    pageSize: 10,
    mainField: "heading",
    defaultSortBy: "heading",
    defaultSortOrder: "ASC",
  },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: true, sortable: true } },
    heading: {
      edit: {
        label: "Заголовок секции",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Заголовок", searchable: true, sortable: true },
    },
    subheading: {
      edit: {
        label: "Подзаголовок / описание",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Подзаголовок", searchable: true, sortable: false },
    },
  },
  layouts: {
    list: ["id", "heading"],
    edit: [[{ name: "heading", size: 12 }], [{ name: "subheading", size: 12 }]],
  },
};

const serviceCardLabels = {
  uid: "api::service-card.service-card",
  settings: {
    bulkable: true,
    filterable: true,
    searchable: true,
    pageSize: 10,
    mainField: "title",
    defaultSortBy: "sortOrder",
    defaultSortOrder: "ASC",
  },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: true, sortable: true } },
    title: {
      edit: {
        label: "Название услуги",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Название", searchable: true, sortable: true },
    },
    description: {
      edit: {
        label: "Описание",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Описание", searchable: true, sortable: false },
    },
    link: {
      edit: {
        label: "Ссылка",
        description: "",
        placeholder: "/services/crm",
        visible: true,
        editable: true,
      },
      list: { label: "Ссылка", searchable: false, sortable: false },
    },
    linkLabel: {
      edit: {
        label: "Текст ссылки",
        description: "",
        placeholder: "Подробнее",
        visible: true,
        editable: true,
      },
      list: { label: "Текст ссылки", searchable: false, sortable: false },
    },
    icon: {
      edit: {
        label: "Иконка",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Иконка", searchable: false, sortable: false },
    },
    isFeatured: {
      edit: {
        label: "Выделенная карточка (тёмный фон)",
        description: "Включи для тёмно-бирюзового варианта",
        visible: true,
        editable: true,
      },
      list: { label: "Выделена", searchable: false, sortable: true },
    },
    sortOrder: {
      edit: {
        label: "Порядок",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Порядок", searchable: false, sortable: true },
    },
  },
  layouts: {
    list: ["id", "title", "isFeatured", "sortOrder"],
    edit: [
      [
        { name: "title", size: 8 },
        { name: "isFeatured", size: 4 },
      ],
      [{ name: "description", size: 12 }],
      [
        { name: "link", size: 8 },
        { name: "linkLabel", size: 4 },
      ],
      [
        { name: "icon", size: 6 },
        { name: "sortOrder", size: 6 },
      ],
    ],
  },
};

type ContentManagerConfig = {
  uid: string;
  metadatas?: Record<string, { edit?: Record<string, unknown>; list?: Record<string, unknown> }>;
  layouts?: { list?: string[]; edit?: unknown[] };
  [key: string]: unknown;
};

function getConfigSchemaFields(strapi: Core.Strapi, uid: string) {
  const contentType = (
    strapi.contentTypes as unknown as Record<
      string,
      { attributes?: Record<string, unknown> }
    >
  )[uid];
  if (contentType?.attributes) {
    return {
      fields: Object.keys(contentType.attributes),
      isContentType: true,
    };
  }

  const component = (
    strapi.components as unknown as Record<
      string,
      { attributes?: Record<string, unknown> }
    >
  )[uid];
  if (component?.attributes) {
    return {
      fields: Object.keys(component.attributes),
      isContentType: false,
    };
  }

  return {
    fields: [] as string[],
    isContentType: false,
  };
}

function normalizeContentManagerConfig(
  strapi: Core.Strapi,
  config: ContentManagerConfig,
): ContentManagerConfig {
  const metadatas = { ...(config.metadatas ?? {}) };
  const { fields: schemaFields, isContentType } = getConfigSchemaFields(
    strapi,
    config.uid,
  );
  const listFields = Array.isArray(config.layouts?.list)
    ? config.layouts.list.filter((field): field is string => typeof field === "string" && field.length > 0)
    : [];

  const contentTypeSystemFields = isContentType
    ? [
        "id",
        "documentId",
        "createdAt",
        "updatedAt",
        "publishedAt",
        "locale",
        "createdBy",
        "updatedBy",
      ]
    : [];

  const fieldsToEnsure = Array.from(
    new Set([...schemaFields, ...contentTypeSystemFields, ...listFields]),
  );

  for (const field of fieldsToEnsure) {
    const fieldMeta = metadatas[field] ?? {};
    metadatas[field] = {
      ...fieldMeta,
      edit: fieldMeta.edit ?? {},
      list:
        fieldMeta.list ?? {
          label: field,
          searchable: false,
          sortable: false,
        },
    };
  }

  return { ...config, metadatas };
}

function getContentManagerStores(strapi: Core.Strapi) {
  return [
    strapi.store({ type: "plugin", name: "content_manager" }),
    strapi.store({ type: "plugin", name: "content-manager" }),
  ];
}

function resolveStoreNameByKey(key: string): "content_manager" | "content-manager" | null {
  if (key.startsWith("plugin_content_manager_")) return "content_manager";
  if (key.startsWith("plugin_content-manager_")) return "content-manager";
  return null;
}

function stripStorePrefix(key: string): string {
  return key
    .replace(/^plugin_content_manager_/, "")
    .replace(/^plugin_content-manager_/, "");
}

async function setContentManagerConfig(
  strapi: Core.Strapi,
  config: ContentManagerConfig,
) {
  const normalized = normalizeContentManagerConfig(strapi, config);
  const key = `configuration_content_types::${normalized.uid}`;

  for (const store of getContentManagerStores(strapi)) {
    await store.set({ key, value: normalized });
  }
}

async function setComponentConfig(
  strapi: Core.Strapi,
  config: ContentManagerConfig,
) {
  const normalized = normalizeContentManagerConfig(strapi, config);
  const key = `configuration_components::${normalized.uid}`;

  for (const store of getContentManagerStores(strapi)) {
    await store.set({ key, value: normalized });
  }
}

async function setContentManagerFieldLabel(
  strapi: Core.Strapi,
  uid: string,
  field: string,
  label: string,
) {
  const key = `configuration_content_types::${uid}`;

  for (const store of getContentManagerStores(strapi)) {
    const current = (await store.get({ key })) as ContentManagerConfig | undefined;
    const currentEditLayout = Array.isArray(current?.layouts?.edit)
      ? current.layouts?.edit
      : [];
    const hasFieldInEditLayout = currentEditLayout.some((row) =>
      Array.isArray(row)
        ? row.some(
            (cell) =>
              typeof cell === "object" &&
              cell !== null &&
              "name" in cell &&
              (cell as { name?: string }).name === field,
          )
        : false,
    );
    const statsRowsIndex = currentEditLayout.findIndex((row) =>
      Array.isArray(row)
        ? row.some(
            (cell) =>
              typeof cell === "object" &&
              cell !== null &&
              "name" in cell &&
              (cell as { name?: string }).name === "statsRows",
          )
        : false,
    );
    const insertIndex = statsRowsIndex >= 0 ? statsRowsIndex + 1 : currentEditLayout.length;
    const nextEditLayout =
      currentEditLayout.length === 0
        ? undefined
        : hasFieldInEditLayout
          ? currentEditLayout
          : [
              ...currentEditLayout.slice(0, insertIndex),
              [{ name: field, size: 12 }],
              ...currentEditLayout.slice(insertIndex),
            ];

    const next: ContentManagerConfig = {
      uid,
      ...(current ?? {}),
      metadatas: {
        ...(current?.metadatas ?? {}),
        [field]: {
          ...(current?.metadatas?.[field] ?? {}),
          edit: {
            ...((current?.metadatas?.[field]?.edit ?? {}) as Record<string, unknown>),
            label,
            visible: true,
            editable: true,
          },
          list: {
            ...((current?.metadatas?.[field]?.list ?? {}) as Record<string, unknown>),
            label,
          },
        },
      },
      layouts: {
        ...(current?.layouts ?? {}),
        ...(nextEditLayout ? { edit: nextEditLayout } : {}),
      },
    };

    await store.set({ key, value: normalizeContentManagerConfig(strapi, next) });
  }
}

async function setContentManagerFieldVisibility(
  strapi: Core.Strapi,
  uid: string,
  field: string,
  visible: boolean,
) {
  const key = `configuration_content_types::${uid}`;

  for (const store of getContentManagerStores(strapi)) {
    const current = (await store.get({ key })) as ContentManagerConfig | undefined;
    if (!current) continue;

    const nextEditLayout = (current.layouts?.edit ?? []).map((row) =>
      Array.isArray(row)
        ? row.filter(
            (cell) =>
              !(
                typeof cell === "object" &&
                cell !== null &&
                "name" in cell &&
                (cell as { name?: string }).name === field &&
                !visible
              ),
          )
        : row,
    );

    const nextListLayout = (current.layouts?.list ?? []).filter(
      (item) => !(item === field && !visible),
    );

    const next: ContentManagerConfig = {
      uid,
      ...current,
      metadatas: {
        ...(current.metadatas ?? {}),
        [field]: {
          ...(current.metadatas?.[field] ?? {}),
          edit: {
            ...((current.metadatas?.[field]?.edit ?? {}) as Record<string, unknown>),
            visible,
          },
          list: {
            ...((current.metadatas?.[field]?.list ?? {}) as Record<string, unknown>),
            searchable: visible,
            sortable: visible,
          },
        },
      },
      layouts: {
        ...(current.layouts ?? {}),
        edit: nextEditLayout,
        list: nextListLayout,
      },
    };

    await store.set({ key, value: normalizeContentManagerConfig(strapi, next) });
  }
}

async function sanitizeExistingContentManagerConfigs(strapi: Core.Strapi) {
  const rows = await strapi.db.connection("strapi_core_store_settings")
    .select(["key", "value"])
    .whereRaw("key ~ ?", [
      "^plugin_content[-_]manager_configuration_(content_types|components)::",
    ]);

  for (const row of rows as Array<{ key: string; value: string | null }>) {
    if (!row.value) continue;

    let parsed: ContentManagerConfig;
    try {
      parsed = JSON.parse(row.value) as ContentManagerConfig;
    } catch {
      continue;
    }

    const normalized = normalizeContentManagerConfig(strapi, parsed);
    if (JSON.stringify(parsed) === JSON.stringify(normalized)) continue;

    const storeName = resolveStoreNameByKey(row.key);
    if (!storeName) continue;

    const store = strapi.store({ type: "plugin", name: storeName });
    await store.set({
      key: stripStorePrefix(row.key),
      value: normalized,
    });
  }
}

const photoCardLabels = {
  uid: "blocks.photo-card",
  settings: {
    bulkable: false,
    filterable: false,
    searchable: false,
    pageSize: 10,
    mainField: "alt",
    defaultSortBy: "id",
    defaultSortOrder: "ASC",
  },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: false, sortable: false } },
    photo: {
      edit: {
        label: "Фотография",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Фото", searchable: false, sortable: false },
    },
    alt: {
      edit: {
        label: "Альт-текст (описание)",
        description: "Используется для доступности и SEO",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Альт-текст", searchable: true, sortable: false },
    },
  },
  layouts: {
    list: ["id", "alt"],
    edit: [[{ name: "photo", size: 12 }], [{ name: "alt", size: 12 }]],
  },
};

const statCardLabels = {
  uid: "blocks.stat-card",
  settings: {
    bulkable: false,
    filterable: false,
    searchable: false,
    pageSize: 10,
    mainField: "value",
    defaultSortBy: "id",
    defaultSortOrder: "ASC",
  },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: false, sortable: false } },
    value: {
      edit: {
        label: "Значение (цифра)",
        description: "Например: 98% или 5 лет",
        placeholder: "98%",
        visible: true,
        editable: true,
      },
      list: { label: "Значение", searchable: true, sortable: false },
    },
    label: {
      edit: {
        label: "Подпись",
        description: "Текст под цифрой",
        placeholder: "клиентов довольны",
        visible: true,
        editable: true,
      },
      list: { label: "Подпись", searchable: true, sortable: false },
    },
    backgroundImage: {
      edit: {
        label: "Фоновое изображение",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Фон", searchable: false, sortable: false },
    },
  },
  layouts: {
    list: ["id", "value", "label"],
    edit: [
      [
        { name: "value", size: 6 },
        { name: "label", size: 6 },
      ],
      [{ name: "backgroundImage", size: 12 }],
    ],
  },
};

const aboutPageLabels = {
  uid: "api::about-page.about-page",
  settings: { bulkable: false, filterable: false, searchable: false, pageSize: 10, mainField: "heading", defaultSortBy: "id", defaultSortOrder: "ASC" },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: false, sortable: false } },
    eyebrow: { edit: { label: "Надпись над заголовком", description: 'Например: "О компании"', placeholder: "О компании", visible: true, editable: true }, list: { label: "Надпись", searchable: true, sortable: false } },
    heading: { edit: { label: "Заголовок", description: "Одна строка. Текст в [квадратных скобках] выделяется цветом", placeholder: "ИНЖЕНЕРНОЕ [БЮРО] [BASIS]THREE", visible: true, editable: true }, list: { label: "Заголовок", searchable: true, sortable: false } },
    headingAccent: { edit: { label: "Старое поле (не используется)", description: "", placeholder: "", visible: false, editable: false }, list: { label: "Старое поле", searchable: false, sortable: false } },
    description: { edit: { label: "Описание", description: "Текст под заголовком", placeholder: "", visible: true, editable: true }, list: { label: "Описание", searchable: false, sortable: false } },
    badge1Text: { edit: { label: "Бейдж 1 (текст)", description: "", placeholder: "САНКТ-ПЕТЕРБУРГ", visible: true, editable: true }, list: { label: "Бейдж 1", searchable: false, sortable: false } },
    badge2Text: { edit: { label: "Бейдж 2 (текст)", description: "", placeholder: "РАБОТАЕМ ПО ВСЕЙ РОССИИ", visible: true, editable: true }, list: { label: "Бейдж 2", searchable: false, sortable: false } },
    badge1Icon: { edit: { label: "Иконка бейджа 1 (SVG/PNG)", visible: true, editable: true }, list: { label: "Иконка 1", searchable: false, sortable: false } },
    badge2Icon: { edit: { label: "Иконка бейджа 2 (SVG/PNG)", visible: true, editable: true }, list: { label: "Иконка 2", searchable: false, sortable: false } },
    sectionTitle: { edit: { label: "Заголовок секции принципов", description: "", placeholder: "«ЦИФРОВОЙ ФУНДАМЕНТ»", visible: true, editable: true }, list: { label: "Секция", searchable: false, sortable: false } },
    backgroundImage: { edit: { label: "Фоновое изображение секции принципов", visible: true, editable: true }, list: { label: "Фон", searchable: false, sortable: false } },
    principles: { edit: { label: "Принципы", description: "Добавь 3 принципа компании", visible: true, editable: true }, list: { label: "Принципы", searchable: false, sortable: false } },
    contactWorkTitle: {
      edit: { label: "Блок контактов: заголовок 1", description: "", placeholder: "Режим работы", visible: true, editable: true },
      list: { label: "Контакты: заголовок 1", searchable: false, sortable: false },
    },
    contactWorkLabel: {
      edit: { label: "Блок контактов: подпись 1", description: "", placeholder: "Мы работаем в ритме бизнеса:", visible: true, editable: true },
      list: { label: "Контакты: подпись 1", searchable: false, sortable: false },
    },
    contactWorkValue: {
      edit: { label: "Блок контактов: значение 1", description: "", placeholder: "Пн - Пт, 10:00 - 18:00", visible: true, editable: true },
      list: { label: "Контакты: значение 1", searchable: false, sortable: false },
    },
    contactWorkIcon: {
      edit: { label: "Блок контактов: иконка 1 (SVG/PNG)", description: "Иконка в верхнем уголке левой карточки", visible: true, editable: true },
      list: { label: "Контакты: иконка 1", searchable: false, sortable: false },
    },
    contactDocsTitle: {
      edit: { label: "Блок контактов: заголовок 2", description: "", placeholder: "Для документов", visible: true, editable: true },
      list: { label: "Контакты: заголовок 2", searchable: false, sortable: false },
    },
    contactDocsPhoneLabel: {
      edit: { label: "Блок контактов: подпись телефона", description: "", placeholder: "Телефон", visible: true, editable: true },
      list: { label: "Контакты: подпись телефона", searchable: false, sortable: false },
    },
    contactDocsPhoneValue: {
      edit: { label: "Блок контактов: телефон", description: "", placeholder: "+7 495 555 66 77", visible: true, editable: true },
      list: { label: "Контакты: телефон", searchable: false, sortable: false },
    },
    contactDocsEmailLabel: {
      edit: { label: "Блок контактов: подпись email", description: "", placeholder: "Эл. почта", visible: true, editable: true },
      list: { label: "Контакты: подпись email", searchable: false, sortable: false },
    },
    contactDocsEmailValue: {
      edit: { label: "Блок контактов: email", description: "", placeholder: "info@basisthree.ru", visible: true, editable: true },
      list: { label: "Контакты: email", searchable: false, sortable: false },
    },
    contactDocsIcon: {
      edit: { label: "Блок контактов: иконка 2 (SVG/PNG)", description: "Иконка в верхнем уголке правой карточки", visible: true, editable: true },
      list: { label: "Контакты: иконка 2", searchable: false, sortable: false },
    },
    contactCoffeeTitle: {
      edit: { label: "Блок контактов: заголовок 3", description: "", placeholder: "Начнем с кофе", visible: true, editable: true },
      list: { label: "Контакты: заголовок 3", searchable: false, sortable: false },
    },
    contactCoffeeText: {
      edit: { label: "Блок контактов: текст 3", description: "", placeholder: "Если вы в Петербурге ...", visible: true, editable: true },
      list: { label: "Контакты: текст 3", searchable: false, sortable: false },
    },
    contactCoffeeButtonLabel: {
      edit: { label: "Блок контактов: кнопка 3", description: "", placeholder: "Договориться о встрече", visible: true, editable: true },
      list: { label: "Контакты: кнопка 3", searchable: false, sortable: false },
    },
    contactCoffeeImage: {
      edit: { label: "Блок контактов: фоновое изображение 3", description: "", visible: true, editable: true },
      list: { label: "Контакты: фон 3", searchable: false, sortable: false },
    },
  },
  layouts: {
    list: ["id", "heading"],
    edit: [
      [{ name: "eyebrow", size: 12 }],
      [{ name: "heading", size: 12 }],
      [{ name: "description", size: 12 }],
      [{ name: "badge1Text", size: 6 }, { name: "badge2Text", size: 6 }],
      [{ name: "badge1Icon", size: 6 }, { name: "badge2Icon", size: 6 }],
      [{ name: "sectionTitle", size: 12 }],
      [{ name: "backgroundImage", size: 12 }],
      [{ name: "principles", size: 12 }],
      [{ name: "contactWorkTitle", size: 4 }, { name: "contactWorkLabel", size: 4 }, { name: "contactWorkValue", size: 4 }],
      [{ name: "contactWorkIcon", size: 12 }],
      [{ name: "contactDocsTitle", size: 12 }],
      [{ name: "contactDocsPhoneLabel", size: 4 }, { name: "contactDocsPhoneValue", size: 8 }],
      [{ name: "contactDocsEmailLabel", size: 4 }, { name: "contactDocsEmailValue", size: 8 }],
      [{ name: "contactDocsIcon", size: 12 }],
      [{ name: "contactCoffeeTitle", size: 6 }, { name: "contactCoffeeButtonLabel", size: 6 }],
      [{ name: "contactCoffeeText", size: 12 }],
      [{ name: "contactCoffeeImage", size: 12 }],
    ],
  },
};

const principleComponentLabels = {
  uid: "blocks.principle",
  settings: { bulkable: false, filterable: false, searchable: false, pageSize: 10, mainField: "title", defaultSortBy: "id", defaultSortOrder: "ASC" },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: false, sortable: false } },
    badge: { edit: { label: "Метка (напр. «Принцип 1»)", visible: true, editable: true }, list: { label: "Метка", searchable: false, sortable: false } },
    title: { edit: { label: "Заголовок принципа", visible: true, editable: true }, list: { label: "Заголовок", searchable: true, sortable: false } },
    paragraph1: { edit: { label: "Абзац 1", visible: true, editable: true }, list: { label: "Абзац 1", searchable: false, sortable: false } },
    paragraph2: { edit: { label: "Абзац 2", visible: true, editable: true }, list: { label: "Абзац 2", searchable: false, sortable: false } },
  },
  layouts: {
    list: ["id", "title"],
    edit: [
      [{ name: "badge", size: 4 }, { name: "title", size: 8 }],
      [{ name: "paragraph1", size: 12 }],
      [{ name: "paragraph2", size: 12 }],
    ],
  },
};

const seoComponentLabels = {
  uid: "shared.seo",
  settings: {
    bulkable: false,
    filterable: false,
    searchable: false,
    pageSize: 10,
    mainField: "metaTitle",
    defaultSortBy: "id",
    defaultSortOrder: "ASC",
  },
  metadatas: {
    id: {
      edit: {},
      list: { label: "ID", searchable: false, sortable: false },
    },
    metaTitle: {
      edit: {
        label: "Мета-заголовок",
        description: "Заголовок страницы в поисковой выдаче",
        visible: true,
        editable: true,
      },
      list: { label: "Мета-заголовок", searchable: true, sortable: false },
    },
    metaDescription: {
      edit: {
        label: "Мета-описание",
        description: "Краткое описание страницы для SEO",
        visible: true,
        editable: true,
      },
      list: { label: "Мета-описание", searchable: false, sortable: false },
    },
    keywords: {
      edit: {
        label: "Ключевые слова",
        description: "Через запятую",
        visible: true,
        editable: true,
      },
      list: { label: "Ключевые слова", searchable: false, sortable: false },
    },
    canonicalUrl: {
      edit: {
        label: "Канонический URL",
        description: "Полный канонический адрес страницы",
        visible: true,
        editable: true,
      },
      list: { label: "Канонический URL", searchable: false, sortable: false },
    },
    robotsNoIndex: {
      edit: {
        label: "Запретить индексацию",
        description: "Если включено, страница будет с meta robots noindex, nofollow",
        visible: true,
        editable: true,
      },
      list: {
        label: "Индексация запрещена",
        searchable: false,
        sortable: false,
      },
    },
    ogTitle: {
      edit: {
        label: "Заголовок превью (OG)",
        description: "Заголовок для превью в соцсетях",
        visible: true,
        editable: true,
      },
      list: { label: "OG заголовок", searchable: false, sortable: false },
    },
    ogDescription: {
      edit: {
        label: "Описание превью (OG)",
        description: "Описание для превью в соцсетях",
        visible: true,
        editable: true,
      },
      list: { label: "OG описание", searchable: false, sortable: false },
    },
    ogImage: {
      edit: {
        label: "Изображение превью (OG)",
        description: "Картинка для карточки ссылки",
        visible: true,
        editable: true,
      },
      list: { label: "OG изображение", searchable: false, sortable: false },
    },
  },
  layouts: {
    list: ["id", "metaTitle", "robotsNoIndex"],
    edit: [
      [{ name: "metaTitle", size: 12 }],
      [{ name: "metaDescription", size: 12 }],
      [{ name: "keywords", size: 12 }],
      [{ name: "canonicalUrl", size: 12 }],
      [{ name: "robotsNoIndex", size: 12 }],
      [{ name: "ogTitle", size: 12 }],
      [{ name: "ogDescription", size: 12 }],
      [{ name: "ogImage", size: 12 }],
    ],
  },
};

const PUBLIC_UIDS = [
  "api::hero-block.hero-block",
  "api::menu-service.menu-service",
  "api::stats-block.stats-block",
  "api::team-member.team-member",
  "api::team-section.team-section",
  "api::services-section.services-section",
  "api::service-card.service-card",
  "api::diag-cta.diag-cta",
  "api::about-page.about-page",
  "api::company-document.company-document",
  "api::contact-request.contact-request",
];

async function grantPublicPermissions(strapi: Core.Strapi) {
  const publicRole = await strapi.db
    .query("plugin::users-permissions.role")
    .findOne({ where: { type: "public" }, populate: ["permissions"] });

  if (!publicRole) return;

  for (const uid of PUBLIC_UIDS) {
    const actions = uid.includes("contact-request")
      ? ["create"]
      : uid.includes("team-member") ||
          uid.includes("menu-service") ||
          uid.includes("service-card")
        ? ["find", "findOne"]
        : ["find"];

    for (const action of actions) {
      const fullAction = `${uid}.${action}`;
      const exists = publicRole.permissions?.some(
        (p: { action: string }) => p.action === fullAction,
      );
      if (!exists) {
        await strapi.db.query("plugin::users-permissions.permission").create({
          data: { action: fullAction, role: publicRole.id },
        });
      }
    }
  }
}

const documentLabels = {
  uid: "api::document.document",
  settings: {
    bulkable: true,
    filterable: true,
    searchable: true,
    pageSize: 20,
    mainField: "name",
    defaultSortBy: "id",
    defaultSortOrder: "DESC",
  },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: true, sortable: true } },
    project: {
      edit: { label: "Проект", visible: true, editable: true },
      list: { label: "Проект", searchable: true, sortable: true },
    },
    name: {
      edit: { label: "Наименование документа", visible: true, editable: true },
      list: { label: "Наименование", searchable: true, sortable: true },
    },
    docStatus: {
      edit: { label: "Состояние", visible: true, editable: true },
      list: { label: "Состояние", searchable: false, sortable: true },
    },
    file: {
      edit: { label: "Файл (PDF)", visible: true, editable: true },
      list: { label: "Файл", searchable: false, sortable: false },
    },
    user: {
      edit: {
        label: "Клиент",
        visible: true,
        editable: true,
        mainField: "email",
      },
      list: { label: "Клиент", searchable: false, sortable: false },
    },
  },
  layouts: {
    list: ["id", "project", "name", "docStatus"],
    edit: [
      [
        { name: "project", size: 6 },
        { name: "name", size: 6 },
      ],
      [
        { name: "docStatus", size: 4 },
        { name: "user", size: 8, mainField: "email" },
      ],
      [{ name: "file", size: 12 }],
    ],
  },
};

const companyDocumentsLabels = {
  uid: "api::company-document.company-document",
  settings: {
    bulkable: false,
    filterable: false,
    searchable: false,
    pageSize: 10,
    mainField: "id",
    defaultSortBy: "id",
    defaultSortOrder: "ASC",
  },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: false, sortable: false } },
    privacyPolicyTitle: {
      edit: {
        label: "Заголовок: Политика конфиденциальности",
        description: "",
        visible: true,
        editable: true,
      },
      list: { label: "Заголовок политики", searchable: true, sortable: false },
    },
    privacyPolicyContent: {
      edit: {
        label: "Текст: Политика конфиденциальности",
        description: "Отображается на странице /privacy. Можно вставлять HTML-теги.",
        visible: true,
        editable: true,
      },
      list: { label: "Текст политики", searchable: false, sortable: false },
    },
    offerAgreementTitle: {
      edit: {
        label: "Заголовок: Договор оферты",
        description: "",
        visible: true,
        editable: true,
      },
      list: { label: "Заголовок оферты", searchable: true, sortable: false },
    },
    offerAgreementContent: {
      edit: {
        label: "Текст: Договор оферты",
        description: "Отображается на странице /oferta. Можно вставлять HTML-теги.",
        visible: true,
        editable: true,
      },
      list: { label: "Текст оферты", searchable: false, sortable: false },
    },
    referralProgramTermsTitle: {
      edit: {
        label: "Заголовок: Условия программы",
        description: "",
        visible: true,
        editable: true,
      },
      list: { label: "Заголовок условий", searchable: true, sortable: false },
    },
    referralProgramTermsContent: {
      edit: {
        label: "Текст: Условия программы",
        description: "Кнопка «Условия программы» в кабинете открывает страницу /referral-terms. Можно вставлять HTML-теги.",
        visible: true,
        editable: true,
      },
      list: { label: "Текст условий", searchable: false, sortable: false },
    },
    socialLinks: {
      edit: {
        label: "Соцсети в футере",
        description: "Ссылки на соцсети для футера сайта.",
        visible: true,
        editable: true,
      },
      list: { label: "Соцсети", searchable: false, sortable: false },
    },
  },
  layouts: {
    list: ["id"],
    edit: [
      [{ name: "privacyPolicyTitle", size: 12 }],
      [{ name: "privacyPolicyContent", size: 12 }],
      [{ name: "offerAgreementTitle", size: 12 }],
      [{ name: "offerAgreementContent", size: 12 }],
      [{ name: "referralProgramTermsTitle", size: 12 }],
      [{ name: "referralProgramTermsContent", size: 12 }],
      [{ name: "socialLinks", size: 12 }],
    ],
  },
};

const socialLinkComponentLabels = {
  uid: "shared.social-link",
  settings: {
    bulkable: false,
    filterable: false,
    searchable: false,
    pageSize: 20,
    mainField: "title",
    defaultSortBy: "id",
    defaultSortOrder: "ASC",
  },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: false, sortable: false } },
    title: {
      edit: { label: "Название", visible: true, editable: true },
      list: { label: "Название", searchable: true, sortable: false },
    },
    url: {
      edit: { label: "Ссылка", visible: true, editable: true },
      list: { label: "Ссылка", searchable: false, sortable: false },
    },
    icon: {
      edit: { label: "Иконка", visible: true, editable: true },
      list: { label: "Иконка", searchable: false, sortable: false },
    },
  },
  layouts: {
    list: ["title", "url"],
    edit: [
      [{ name: "title", size: 6 }, { name: "url", size: 6 }],
      [{ name: "icon", size: 12 }],
    ],
  },
};

const usersPermissionsUserLabels = {
  uid: "plugin::users-permissions.user",
  settings: {
    bulkable: true,
    filterable: true,
    searchable: true,
    pageSize: 20,
    mainField: "email",
    defaultSortBy: "id",
    defaultSortOrder: "DESC",
  },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: true, sortable: true } },
    username: {
      edit: { label: "Логин", visible: true, editable: true },
      list: { label: "Логин", searchable: true, sortable: true },
    },
    email: {
      edit: { label: "Email", visible: true, editable: true },
      list: { label: "Email", searchable: true, sortable: true },
    },
    firstName: {
      edit: { label: "Имя", visible: true, editable: true },
      list: { label: "Имя", searchable: true, sortable: true },
    },
    lastName: {
      edit: { label: "Фамилия", visible: true, editable: true },
      list: { label: "Фамилия", searchable: true, sortable: true },
    },
    middleName: {
      edit: { label: "Отчество", visible: true, editable: true },
      list: { label: "Отчество", searchable: true, sortable: true },
    },
    phone: {
      edit: { label: "Телефон", visible: true, editable: true },
      list: { label: "Телефон", searchable: true, sortable: false },
    },
    company: {
      edit: { label: "Компания", visible: true, editable: true },
      list: { label: "Компания", searchable: true, sortable: false },
    },
    confirmed: {
      edit: { label: "Подтвержден", visible: true, editable: true },
      list: { label: "Подтвержден", searchable: false, sortable: true },
    },
    blocked: {
      edit: { label: "Заблокирован", visible: true, editable: true },
      list: { label: "Заблокирован", searchable: false, sortable: true },
    },
    role: {
      edit: { label: "Роль", visible: true, editable: true },
      list: { label: "Роль", searchable: false, sortable: false },
    },
  },
  layouts: {
    list: ["id", "username", "email", "phone", "company", "confirmed", "blocked"],
    edit: [
      [
        { name: "username", size: 6 },
        { name: "email", size: 6 },
      ],
      [
        { name: "firstName", size: 4 },
        { name: "lastName", size: 4 },
        { name: "middleName", size: 4 },
      ],
      [
        { name: "phone", size: 6 },
        { name: "company", size: 6 },
      ],
      [
        { name: "confirmed", size: 6 },
        { name: "blocked", size: 6 },
      ],
      [{ name: "role", size: 12 }],
    ],
  },
};

const referralLabels = {
  uid: "api::referral.referral",
  settings: {
    bulkable: true,
    filterable: true,
    searchable: true,
    pageSize: 20,
    mainField: "company",
    defaultSortBy: "id",
    defaultSortOrder: "DESC",
  },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: true, sortable: true } },
    inviterUserId: {
      edit: {
        label: "ID пригласившего пользователя (техническое)",
        description: "Заполняется автоматически из поля «Пригласивший пользователь»",
        placeholder: "",
        visible: false,
        editable: false,
      },
      list: {
        label: "ID пригласившего",
        searchable: true,
        sortable: true,
      },
    },
    inviterUser: {
      edit: {
        label: "Пригласивший пользователь",
        description: "Выберите пользователя по email",
        placeholder: "",
        visible: true,
        editable: true,
        mainField: "email",
      },
      list: { label: "Пригласивший (email)", searchable: false, sortable: false },
    },
    contactPerson: {
      edit: {
        label: "Контактное лицо",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Контактное лицо", searchable: true, sortable: true },
    },
    email: {
      edit: {
        label: "Email",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Email", searchable: true, sortable: true },
    },
    phone: {
      edit: {
        label: "Телефон",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Телефон", searchable: true, sortable: false },
    },
    company: {
      edit: {
        label: "Компания",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Компания", searchable: true, sortable: true },
    },
    product: {
      edit: {
        label: "Продукт",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Продукт", searchable: true, sortable: true },
    },
    referralStatus: {
      edit: {
        label: "Статус",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Статус", searchable: true, sortable: true },
    },
    payout: {
      edit: {
        label: "Выплата (₽)",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
      },
      list: { label: "Выплата", searchable: false, sortable: true },
    },
    user: {
      edit: {
        label: "Клиент",
        description: "",
        placeholder: "",
        visible: true,
        editable: true,
        mainField: "email",
      },
      list: { label: "Клиент", searchable: false, sortable: true },
    },
  },
  layouts: {
    list: [
      "id",
      "inviterUser",
      "inviterUserId",
      "contactPerson",
      "company",
      "product",
      "referralStatus",
      "payout",
    ],
    edit: [
      [
        { name: "inviterUser", size: 4, mainField: "email" },
        { name: "contactPerson", size: 4 },
        { name: "company", size: 4 },
      ],
      [
        { name: "email", size: 6 },
        { name: "phone", size: 6 },
      ],
      [
        { name: "product", size: 4 },
        { name: "referralStatus", size: 4 },
        { name: "payout", size: 4 },
      ],
      [{ name: "user", size: 12, mainField: "email" }],
    ],
  },
};

const contactRequestLabels = {
  uid: "api::contact-request.contact-request",
  settings: {
    bulkable: true,
    filterable: true,
    searchable: true,
    pageSize: 25,
    mainField: "name",
    defaultSortBy: "id",
    defaultSortOrder: "DESC",
  },
  metadatas: {
    id: { edit: {}, list: { label: "ID", searchable: true, sortable: true } },
    name: {
      edit: { label: "Имя", visible: true, editable: true },
      list: { label: "Имя", searchable: true, sortable: true },
    },
    company: {
      edit: { label: "Компания", visible: true, editable: true },
      list: { label: "Компания", searchable: true, sortable: true },
    },
    direction: {
      edit: { label: "Направление", visible: true, editable: true },
      list: { label: "Направление", searchable: true, sortable: true },
    },
    pain: {
      edit: { label: "Описание проблемы", visible: true, editable: true },
      list: { label: "Проблема", searchable: true, sortable: false },
    },
    turnover: {
      edit: { label: "Оборот компании", visible: true, editable: true },
      list: { label: "Оборот", searchable: true, sortable: true },
    },
    employeeCount: {
      edit: { label: "Количество сотрудников", visible: true, editable: true },
      list: { label: "Сотрудники", searchable: true, sortable: true },
    },
    phone: {
      edit: { label: "Телефон", visible: true, editable: true },
      list: { label: "Телефон", searchable: true, sortable: true },
    },
    consent: {
      edit: { label: "Согласие на обработку ПД", visible: true, editable: true },
      list: { label: "Согласие", searchable: false, sortable: true },
    },
    source: {
      edit: { label: "Источник", visible: true, editable: true },
      list: { label: "Источник", searchable: true, sortable: true },
    },
  },
  layouts: {
    list: ["id", "name", "company", "direction", "phone", "consent", "source"],
    edit: [
      [
        { name: "name", size: 6 },
        { name: "company", size: 6 },
      ],
      [
        { name: "direction", size: 6 },
        { name: "phone", size: 6 },
      ],
      [{ name: "pain", size: 12 }],
      [
        { name: "turnover", size: 6 },
        { name: "employeeCount", size: 6 },
      ],
      [
        { name: "consent", size: 6 },
        { name: "source", size: 6 },
      ],
    ],
  },
};

async function grantAuthenticatedPermissions(strapi: Core.Strapi) {
  const authRole = await strapi.db
    .query("plugin::users-permissions.role")
    .findOne({ where: { type: "authenticated" }, populate: ["permissions"] });

  if (!authRole) return;

  const needed = [
    "plugin::users-permissions.user.me",
    "plugin::users-permissions.user.updateMe",
    "plugin::users-permissions.user.update",
    "api::document.document.find",
    "api::document.document.findOne",
    "api::referral.referral.find",
    "api::referral.referral.findOne",
    "api::referral.referral.create",
  ];

  for (const action of needed) {
    const exists = authRole.permissions?.some(
      (p: { action: string }) => p.action === action,
    );
    if (!exists) {
      await strapi.db.query("plugin::users-permissions.permission").create({
        data: { action, role: authRole.id },
      });
    }
  }
}

function patchDocumentUserRelationMainField(strapi: Core.Strapi) {
  const contentTypesService = strapi.plugin("content-manager").service("content-types") as {
    findConfiguration: (model: { uid: string }) => Promise<ContentManagerConfig>;
  };

  const originalFindConfiguration = contentTypesService.findConfiguration.bind(contentTypesService);

  contentTypesService.findConfiguration = async (model: { uid: string }) => {
    const config = await originalFindConfiguration(model);

    if (model.uid !== "api::document.document") {
      return config;
    }

    return {
      ...config,
      metadatas: {
        ...(config.metadatas ?? {}),
        user: {
          ...(config.metadatas?.user ?? {}),
          edit: {
            ...((config.metadatas?.user?.edit ?? {}) as Record<string, unknown>),
            mainField: "email",
          },
        },
      },
    };
  };
}

function patchRelationsControllerMainField(strapi: Core.Strapi) {
  const relationsController = strapi.plugin("content-manager").controller("relations") as unknown as {
    extractAndValidateRequestInfo: (
      ctx: unknown,
      id?: string,
    ) => Promise<{
      mainField?: string;
      fieldsToSelect?: string[];
      target?: { schema?: { uid?: string } };
    }>;
  };

  const originalExtract = relationsController.extractAndValidateRequestInfo.bind(relationsController);

  relationsController.extractAndValidateRequestInfo = async (ctx: unknown, id?: string) => {
    const info = await originalExtract(ctx, id);
    const targetUid = info.target?.schema?.uid;
    if (!targetUid) return info;

    const targetSchema = (
      strapi.contentTypes as unknown as Record<string, { attributes?: Record<string, unknown> }>
    )[targetUid];
    const attributes = targetSchema?.attributes ?? {};

    const preferredField =
      targetUid === "plugin::users-permissions.user"
        ? "email"
        : ["name", "title", "label", "username", "slug"].find((field) =>
            Object.prototype.hasOwnProperty.call(attributes, field),
          );

    if (!preferredField) return info;

    const nextFields = Array.from(
      new Set([...(info.fieldsToSelect ?? []), preferredField, "id", "documentId"]),
    );

    return {
      ...info,
      mainField: preferredField,
      fieldsToSelect: nextFields,
    };
  };
}

export default {
  register() {},

  async bootstrap({ strapi }: { strapi: Core.Strapi }) {
    patchDocumentUserRelationMainField(strapi);
    patchRelationsControllerMainField(strapi);
    await sanitizeExistingContentManagerConfigs(strapi);
    await setContentManagerConfig(strapi, heroBlockLabels);
    await setContentManagerConfig(strapi, menuServiceLabels);
    await setComponentConfig(strapi, photoCardLabels);
    await setComponentConfig(strapi, statCardLabels);
    await setContentManagerConfig(strapi, statsBlockLabels);
    await setContentManagerConfig(strapi, teamMemberLabels);
    await setContentManagerConfig(strapi, teamSectionLabels);
    await setContentManagerConfig(strapi, diagCtaLabels);
    await setContentManagerConfig(strapi, servicesSectionLabels);
    await setContentManagerConfig(strapi, serviceCardLabels);
    await setContentManagerConfig(strapi, documentLabels);
    await setContentManagerConfig(strapi, usersPermissionsUserLabels);
    await setContentManagerConfig(strapi, referralLabels);
    await setContentManagerConfig(strapi, contactRequestLabels);
    await setContentManagerConfig(strapi, aboutPageLabels);
    await setContentManagerConfig(strapi, companyDocumentsLabels);
    await setComponentConfig(strapi, principleComponentLabels);
    await setComponentConfig(strapi, seoComponentLabels);
    await setComponentConfig(strapi, socialLinkComponentLabels);
    await setContentManagerFieldLabel(
      strapi,
      "api::hero-block.hero-block",
      "seo",
      "SEO-настройки",
    );
    await setContentManagerFieldLabel(
      strapi,
      "api::about-page.about-page",
      "seo",
      "SEO-настройки",
    );
    await setContentManagerFieldLabel(
      strapi,
      "api::service-page.service-page",
      "heroHeading",
      "Заголовок Hero (акцент выделяй через %%текст%%)",
    );
    await setContentManagerFieldLabel(
      strapi,
      "api::service-page.service-page",
      "problemTitle",
      "Заголовок проблем (акцент выделяй через %%текст%%)",
    );
    await setContentManagerFieldVisibility(
      strapi,
      "api::service-page.service-page",
      "heroHeadingAccent",
      false,
    );
    await setContentManagerFieldVisibility(
      strapi,
      "api::service-page.service-page",
      "problemTitleAccent",
      false,
    );
    await setContentManagerFieldLabel(
      strapi,
      "api::service-page.service-page",
      "statsBottomText",
      "Текст под таблицей",
    );
    await setContentManagerFieldLabel(
      strapi,
      "api::service-page.service-page",
      "seo",
      "SEO-настройки",
    );
    await grantPublicPermissions(strapi);
    await grantAuthenticatedPermissions(strapi);
  },
};
