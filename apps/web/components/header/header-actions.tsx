import { ArrowRight, UserRound } from "lucide-react";

type HeaderActionsProps = {
  className?: string;
  mobile?: boolean;
};

export function HeaderActions({ className = "flex items-center gap-2", mobile = false }: HeaderActionsProps) {
  return (
    <div className={className}>
      <button
        type="button"
        aria-label="Профиль"
        className="grid h-10 w-10 place-items-center rounded-full "
      >
        <UserRound size={34} />
      </button>
      <button
        type="button"
        className={[
          "inline-flex items-center gap-2 rounded-full border border-[var(--accent)] px-4 py-2 text-sm font-regular text-black hover:text-white transition hover:bg-[var(--accent-strong)]",
          mobile ? "normal-case" : "",
        ]
          .join(" ")
          .trim()}
      >
        Начать диагностику
        <ArrowRight size={16} />
      </button>
    </div>
  );
}
