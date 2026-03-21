import { codeToHtml } from "shiki";

const theme = {
  name: "glimr",
  type: "light" as const,
  bg: "transparent",
  fg: "#4c4f69",
  settings: [
    { scope: ["comment", "punctuation.definition.comment"], settings: { foreground: "#9ca0b0" } },
    { scope: ["keyword", "storage.type", "storage.modifier"], settings: { foreground: "#fd6abb" } },
    { scope: ["entity.name.function", "support.function"], settings: { foreground: "#1e66f5" } },
    { scope: ["entity.name.type", "support.type", "support.class"], settings: { foreground: "#1e66f5" } },
    { scope: ["string", "string.quoted"], settings: { foreground: "#40a02b" } },
    { scope: ["constant.numeric"], settings: { foreground: "#fb98cf" } },
    { scope: ["keyword.control.import", "meta.import"], settings: { foreground: "#8839ef" } },
    { scope: ["variable", "meta.definition.variable"], settings: { foreground: "#4c4f69" } },
    { scope: ["entity.name.tag"], settings: { foreground: "#1e66f5" } },
    { scope: ["entity.other.attribute-name"], settings: { foreground: "#fd6abb" } },
    { scope: ["punctuation.definition.tag"], settings: { foreground: "#1e66f5" } },
    { scope: ["constant.language"], settings: { foreground: "#fd6abb" } },
    { scope: ["entity.name.namespace", "entity.name.module"], settings: { foreground: "#8839ef" } },
    { scope: ["variable.parameter", "variable.other"], settings: { foreground: "#4c4f69" } },
    { scope: ["punctuation"], settings: { foreground: "#4c4f69" } },
    { scope: ["keyword.operator"], settings: { foreground: "#fd6abb" } },
  ],
};

async function highlightAll() {
  const blocks = document.querySelectorAll<HTMLElement>("code[data-lang]");

  for (const block of blocks) {
    if (block.querySelector("span")) continue;

    const lang = block.dataset.lang || "text";
    const code = block.textContent || "";

    const html = await codeToHtml(code, { lang, theme });

    const temp = document.createElement("div");
    temp.innerHTML = html;
    const highlighted = temp.querySelector("code");
    if (highlighted) {
      block.innerHTML = highlighted.innerHTML;
    }
  }
}

highlightAll();

// Re-run after Loom SPA navigation
document.addEventListener("loom:navigated", () => highlightAll());
