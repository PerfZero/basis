import { Fragment } from "react";
import { splitCmsTextLines } from "@/lib/text-format";

type FormattedTextProps = {
  text: string;
};

export function FormattedText({ text }: FormattedTextProps) {
  const lines = splitCmsTextLines(text);

  return (
    <>
      {lines.map((line, index) => (
        <Fragment key={index}>
          {index > 0 && <br />}
          {line}
        </Fragment>
      ))}
    </>
  );
}
