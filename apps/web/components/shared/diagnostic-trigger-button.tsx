"use client";

import { type ReactNode, useState } from "react";
import { DiagnosticModal } from "@/components/header/diagnostic-modal";

type Props = {
  className?: string;
  children: ReactNode;
  dataTargetHref?: string;
};

export function DiagnosticTriggerButton({ className, children, dataTargetHref }: Props) {
  const [open, setOpen] = useState(false);
  return (
    <>
      <button
        type="button"
        className={className}
        onClick={() => setOpen(true)}
        data-target-href={dataTargetHref}
      >
        {children}
      </button>
      {open && <DiagnosticModal onClose={() => setOpen(false)} />}
    </>
  );
}
