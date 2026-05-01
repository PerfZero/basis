export function normalizeCmsText(value: string): string {
  return value
    .replace(/&lt;\s*br\s*\/?\s*&gt;/gi, "\n")
    .replace(/<br\s*\/?>/gi, "\n")
    .replace(/&nbsp;|&#160;/gi, " ")
    .replace(/[\u2028\u2029]/g, "\n");
}

export function splitCmsTextLines(value: string): string[] {
  return normalizeCmsText(value).split(/\r?\n/);
}
