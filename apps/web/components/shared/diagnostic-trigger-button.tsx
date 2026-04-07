"use client";

import { type ReactNode, useState } from "react";
import { DiagnosticModal } from "@/components/header/diagnostic-modal";

type Props = {
  className?: string;
  children: ReactNode;
};

export function DiagnosticTriggerButton({ className, children }: Props) {
  const [open, setOpen] = useState(false);
  return (
    <>
      <button type="button" className={className} onClick={() => setOpen(true)}>
        {children}
      </button>
      {open && <DiagnosticModal onClose={() => setOpen(false)} />}
    </>
  );
}
