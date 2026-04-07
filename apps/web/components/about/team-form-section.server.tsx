import { getTeamSection } from "@/lib/strapi/team";
import { getAboutPage } from "@/lib/strapi/about-page";
import { TeamFormSection } from "./team-form-section";

export async function TeamFormSectionServer() {
  const [teamData, aboutPage] = await Promise.all([getTeamSection(), getAboutPage()]);

  return (
    <TeamFormSection
      {...teamData}
      contactBlock={{
        workTitle: aboutPage?.contactWorkTitle,
        workLabel: aboutPage?.contactWorkLabel,
        workValue: aboutPage?.contactWorkValue,
        workIconUrl: aboutPage?.contactWorkIcon?.url,
        docsTitle: aboutPage?.contactDocsTitle,
        docsPhoneLabel: aboutPage?.contactDocsPhoneLabel,
        docsPhoneValue: aboutPage?.contactDocsPhoneValue,
        docsEmailLabel: aboutPage?.contactDocsEmailLabel,
        docsEmailValue: aboutPage?.contactDocsEmailValue,
        docsIconUrl: aboutPage?.contactDocsIcon?.url,
        coffeeTitle: aboutPage?.contactCoffeeTitle,
        coffeeText: aboutPage?.contactCoffeeText,
        coffeeButtonLabel: aboutPage?.contactCoffeeButtonLabel,
        coffeeImageUrl: aboutPage?.contactCoffeeImage?.url,
      }}
    />
  );
}
