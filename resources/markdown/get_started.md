# Get Started - Bausteinübersicht

<details open>

<summary>Application/Admin/Shared</summary>

## Layout.vue

Seitenvorlage für alle Vue-Seiten der Anwendung Administration.

### props

- title

### slots

- header
- namenloser Slot (\*)

</details>

<details>

<summary>Application/Auth/Shared</summary>

## Layout.vue

Seitenvorlage für alle Vue-Seiten zum Thema Authentifizierung.

### props

- title

### slots

- logo
- namenloser Slot (\*)

</details>

<details>
<summary>Application/Components</summary>

## ButtonChangeMode.vue

Hier kann der Anwender den Modus "Helligkeit" ändern.

### props

- mode
- class

### emits

- changeMode

### slots

- title
- description
- content
- footer

## DialogModal.vue

Modales Fenster. Kann als Eingabeformular dienen.
Nutzt den Vue-Baustein Modal.vue aus Application/Components.

### props

- show
- maxWidth
- closeable

### emits

- close

## Modal.vue

Modales Fenster. Kann als Eingabeformular dienen.

### props

- show
- maxWidth
- closeable

### emits

- close

## NavigationCard.vue

Dieser Baustein dient zur Navigation in der Anwendung.

### props

- withIcon
- icon
- title
- routeName
- linkName
- target
- routeName2
- linkName2

### emits

- close

### slots

- description

## SmoothScroll.vue

Mit diesem Baustein kannst du zu einer bestimmten Stelle scrollen.

### props

- href

### slots

- namenloser Slot (\*)

</details>

<details>
<summary>Application/Components/Content</summary>

## Alert.vue

Baustein zur Anzeige von Informationen.

### props

- title
- description
- type

### slots

- namenloser Slot (\*)

## Breadcrumb.vue

Diese Vue-Komponente stellt eine Breadcrumb-Navigation dar, die es Benutzern ermöglicht, ihre aktuelle Position innerhalb der Anwendung zu erkennen und effizient zwischen verschiedenen Seiten zu navigieren.

### props

- home
- applicationName
- current
- breadcrumbs
- startPage

## DisplayDate.vue

Baustein zur Anzeige eines Datums.

### props

- value
- timeOn

## DisplayHyperlink.vue

Diese Vue-Komponente ermöglicht die dynamische Darstellung von Links in verschiedenen Stilen (wie Buttons oder Inline-Text), um sich den jeweiligen Kontexten und Designanforderungen der Benutzeroberfläche anzupassen.

### props

- href
- target
- displayType
- method

### slots

- namenloser Slot (\*)

## DisplayNumber.vue

Baustein zur Anzeige von Zahlen.

### props

- value
- afterDigits
- valueUnit
- valueSingleUnit
- valueUnitClass

## DisplayText.vue

Baustein zur Anzeige eines Textes.

### props

- value

### slots

- namenloser Slot (\*)

## DisplayYesOrNo.vue

Baustein zur Anzeige eines Booleans.

### props

- value

## Dropdown.vue

Diese Vue-Komponente implementiert ein anpassbares Dropdown-Menü, das sich beim Klicken öffnet und zusätzliche Inhalte in einem Overlay anzeigt, das automatisch geschlossen werden kann, etwa durch erneutes Klicken oder Drücken der Escape-Taste.

### props

- align
- with
- autoClose
- contentClasses

## DropdownLink.vue

Diese Vue-Komponente fungiert als interaktiver Link oder Schaltfläche, die optional ein Dropdown-Symbol und Tooltips integriert und für die Navigation innerhalb oder außerhalb der Anwendung verwendet werden kann.

### props

- routeName
- withIcon
- withRoute
- withTarget
- tippyText

## FooterGrid.vue

Fusszeile aller Anwendungen.

## Markdown.vue

Diese Vue-Komponente dient dazu, Markdown-Inhalte sicher zu rendern und sie mit benutzerdefinierten Stilen anzuzeigen, um eine konsistente und ansprechende Benutzeroberfläche zu gewährleisten.

### props

- markdown

## NavLink.vue

Diese Vue-Komponente stellt einen navigierbaren Link dar, der dynamisch zwischen einem anklickbaren Link und einem statischen Textelement wechselt, abhängig davon, ob eine Route angegeben ist, und visuell hervorgehoben wird, wenn er aktiv ist.

### props

- label
- routeName
- target
- active

## PageContent

Diese Vue-Komponente dient als Container, der einen Slot für Inhalte bietet und diesen in einem stilvoll gestalteten Hintergrund einbettet, um die Lesbarkeit und Ästhetik der Seite zu verbessern.

### slots

- namenloser Slot (\*)

## PageParagraph.vue

Diese Vue-Komponente dient als wiederverwendbarer Container für Absätze, die durch einen Slot eingefügt werden, um Textelemente strukturiert und konsistent auf Webseiten darzustellen.

### slots

- content

## PageTitle.vue

Diese Vue-Komponente dient als wiederverwendbarer Container für Überschriften, wobei sie durch einen Slot Texte aufnimmt und diese prominent in einer größeren, fettgedruckten Schriftart darstellt, um die Aufmerksamkeit auf wichtige Titel auf Webseiten zu lenken.

### slots

- title

## ResponsiveNavLink.vue

Diese Vue-Komponente ermöglicht es, einen wiederverwendbaren und ansprechbaren Navigationslink oder eine Schaltfläche zu erstellen, der/die je nach Eigenschaft (as) entweder als HTML-Button oder als Link dargestellt wird, wobei beide Elemente durch angepasste Klassen stilisiert sind und auf Interaktionen mit Fokus- und Hover-Effekten reagieren.

### props

- active
- href
- as
- target

## SectionBorder.vue

Diese Vue-Komponente erstellt eine dekorative Trennlinie, die nur auf größeren Bildschirmen (ab Small-Medienbreite) sichtbar ist, und dient dazu, Inhaltsbereiche visuell voneinander abzugrenzen, indem sie einen stilvollen horizontalen Strich in heller oder dunkler Farbe, passend zum eingestellten Farbschema, anzeigt.

## SectionForm.vue

Diese Vue-Komponente stellt ein flexibles Formularbereichs-Layout dar, das optional einen Titel und eine Beschreibung sowie Slots für Formularelemente und Aktionen bietet. Es unterstützt die strukturierte Darstellung von Formulardaten und bietet eine einheitliche Benutzeroberfläche, wobei es auf Benutzerinteraktionen durch das Auslösen eines submitted-Events reagie

### props

- withTitle

### emits

- submitted

## SectionTitle.vue

Diese Vue-Komponente dient als Titelabschnitt für eine Benutzeroberfläche, wobei sie eine Überschrift und eine dazugehörige Beschreibung anzeigt. Die Komponente bietet Slots für beide Inhalte, wodurch sie vielseitig in verschiedenen Teilen der Anwendung einsetzbar ist, um konsistente und stilgerechte Überschriften zu gewährleisten.

## Toast.vue

Diese Vue-Komponente dient als multifunktionales Toast-Benachrichtigungssystem, das verschiedene Nachrichtentypen (Erfolg, Information, Warnung, Fehler) visuell darstellt. Es bietet anpassbare Icons und Stile je nach Nachrichtentyp und beinhaltet eine Schließen-Funktion, um die Benachrichtigung manuell auszublenden. Die Komponente reagiert dynamisch auf Änderungen der Nachrichten über Page-Props und kann das Aussehen basierend auf dem Kontext der Nachricht anpassen.

</details>

<details>
<summary>Application/Homepage/Shared</summary>

## BlogPreviewBig.vue

Anzeige einer Blogübersicht im Format "Groß".

### props

- blog

## BlogPreviewSmall.vue

Anzeige einer Blogübersicht im Format "Klein".

### props

- blog

## BlogShow.vue

Anzeige eines Blogartikels.

### props

- blog
- blogarticle

## Layout.vue

Seitenvorlage für alle Vue-Seiten der Anwendung Homepage.

### props

- headerTitle
- headerDescription
- headerUrl
- headerImage
- noIndexNoFollow

</details>

<details>
<summary>Application/Contents/Form</summary>

## ButtonGroup.vue

Container für Buttons.

### props

- align

## ErrorList.vue

Diese Vue-Komponente fungiert als Fehleranzeige, die eine Liste von Fehlermeldungen darstellt, wenn Validierungsfehler in Formulareingaben auftreten. Sie visualisiert diese Fehler in einem gut sichtbaren Layout mit einem auffälligen Icon und animierten Elementen, um die Aufmerksamkeit des Benutzers effektiv auf die Probleme zu lenken und so die Benutzerfreundlichkeit der Anwendung zu verbessern.

### props

- errors

## InputActionMessage.vue

Diese Vue-Komponente ist darauf ausgelegt, eine Aktion-Nachricht neben Formulareingaben anzuzeigen, die sichtbar wird, wenn eine bestimmte Bedingung (`on` prop) erfüllt ist. Die Nachricht blendet sich bei Deaktivierung sanft aus, dank der Verwendung von Vue's Transition-Komponente, die eine weiche Animation für das Verschwinden der Nachricht ermöglicht, um das Nutzererlebnis zu verbessern und Feedback in einer unaufdringlichen Art und Weise zu liefern.

### props

- on

## InputButton.vue

Diese Vue-Komponente ist ein wiederverwendbarer Button für Formulare, der gestaltet ist, um verschiedene Aktionen auszulösen, wie das Absenden von Daten. Er bietet Anpassbarkeit durch Slots für Inhalte und Reaktivität durch verschiedene Zustände wie "disabled", und ist auf Barrierefreiheit durch Funktionen wie "focus:ring" ausgerichtet. Die Anpassung der Größe, der Rundung, der Schriftgröße und des Tracking ist ebenso enthalten, um eine konsistente Benutzeroberfläche zu gewährleisten.

### props

- type

### slots

- namenloser Slot (\*)

## InputCheckbox.vue

Diese Vue-Komponente implementiert ein benutzerdefiniertes Checkbox-Element, das für Formulare verwendet wird und Features wie Zustandsbindung (`modelValue`), individuelle Beschriftung (`label`), Hilfetext (`helptext`) und individuelles Styling unterstützt. Die Komponente ist reaktiv gestaltet, um Änderungen am Kontrollkästchen zu erfassen und den neuen Wert über das Event `update:modelValue` zu kommunizieren. Zusätzlich bietet sie Tooltips für zusätzliche Informationen und unterstützt dunkle und helle Themen für eine ansprechende visuelle Darstellung.

### props

- name
- modelValue
- label
- helptext
- checked

### slots

- namenloser Slot (\*)

### emits

- update:modelValue

## InputContainer.vue

Diese Vue-Komponente fungiert als Container für Formulareingaben, bietet einen Slot für beliebige Inhalte und lässt sich über eine Eigenschaft (`fullWidth`) steuern, ob der Container vollständig breit sein soll oder nicht. Diese Flexibilität macht es einfach, das Layout von Formularfeldern je nach Bedarf zu gestalten und anzupassen.

### props

- fullWidth

## InputDangerButton.vue

Diese Vue-Komponente repräsentiert einen speziell gestalteten Gefahren-Button, der typischerweise für Aktionen wie Löschen oder Abbrechen verwendet wird. Der Button nutzt anpassbare Klassen für das Hervorheben im Gefahrenkontext und bietet umfangreiche Stiloptionen wie abgerundete Kanten, mittlere Schriftgröße und engen Textabstand. Zudem ist er für barrierefreie Bedienung optimiert mit Fokus-Ringen und einer nicht aktivierbaren Opazität, wenn er deaktiviert ist.

### props

- type

## InputElement.vue

Diese Vue-Komponente ist ein vielseitig einsetzbares Eingabefeld für Formulare, das umfassende Anpassungsmöglichkeiten in Bezug auf Stil und Verhalten bietet. Es unterstützt die Zwei-Wege-Bindung mittels `modelValue` und sendet Updates beim Eintippen über ein `update:modelValue` Event. Die Komponente ist mit umfassenden CSS-Klassen ausgestattet, die sowohl für ein helles als auch für ein dunkles Design geeignet sind, einschließlich spezieller Zustände für Fokus und Auswahl. Zusätzlich ermöglicht die Methode `focus`, das Eingabefeld programmatisch zu fokussieren, was die Interaktivität und Benutzerfreundlichkeit erhöht.

### props

- name
- modelValue
- placeholder
- required

### slots

- namenloser Slot (\*)

### emits

- update:modelValue

## InputError.vue

Diese Vue-Komponente dient dazu, Fehlermeldungen in einem Formular anzuzeigen. Die Meldungen werden in einem auffällig gefärbten und abgerundeten Container präsentiert, der sowohl in einem hellen als auch in einem dunklen Thema ansprechend gestaltet ist. Der Text ist für eine klare Lesbarkeit farblich hervorgehoben. Die Komponente zeigt den Inhalt nur an, wenn eine Fehlermeldung vorhanden ist (`message`), was die Benutzeroberfläche übersichtlich und frei von unnötigen Elementen hält.

### props

- message

## InputGroup.vue

Diese Vue-Komponente stellt einen Container dar, der als Eingabegruppe in Formularen dient. Er nutzt das Grid-Layout, um die Kinder-Elemente (meistens Eingabefelder), die über Slots eingefügt werden, zu organisieren. Auf kleinen Bildschirmen werden die Elemente in einer einzigen Spalte angezeigt, während auf größeren Bildschirmen zwei Spalten verwendet werden, um die Formularelemente übersichtlich und zugänglich zu gestalten. Die Komponente bietet flexible Abstände zwischen den Elementen, die sich je nach Bildschirmgröße anpassen.

### slots

- namenloser Slot (\*)

## InputGroup.vue

Diese Vue-Komponente dient als Layout-Container, der Formularelemente in einem responsiven Grid-System anordnet, um die Struktur und Organisation von Formularfeldern auf verschiedenen Bildschirmgrößen zu verbessern.

### slots

- namenloser Slot (\*)

## InputHTML.vue

Diese Vue-Komponente dient als benutzerdefinierter HTML-Texteditor, der es ermöglicht, Texte direkt im Browser zu formatieren. Die Komponente bietet Funktionalitäten, um Text fett, kursiv zu setzen oder als Überschriften verschiedener Ebenen zu formatieren, indem sie auf einfache Button-Klicks reagiert. Zusätzlich passt sie das Formatieren des Inhalts an und ermöglicht es dem Nutzer, diese Änderungen durch die ContentEditable-Funktion direkt in einem bearbeitbaren Div zu sehen und zu manipulieren. Die Komponente reagiert auf Fokusereignisse, um das Bearbeitungsmenü anzuzeigen, und aktualisiert den `modelValue` des Elternelements mittels eines Vue-Ereignisses (`update:modelValue`), wenn der Inhalt des Editors sich ändert.

### props

- modelValue

### emits

- update:modelValue

## InputIconHyperlink.vue

Diese Vue-Komponente ist ein vielseitiger, anpassbarer Hyperlink, der in verschiedenen visuellen Stilen wie Schaltflächen, Tabelle oder gefährlichem Tabelle-Element dargestellt werden kann, je nachdem, welcher `display_type` gewählt wird. Jede Stiloption passt die Darstellung des Links an und unterstützt das Einfügen von Icons und Text über Slots. Die Komponente nutzt auch Zugänglichkeitsfunktionen wie `focus:ring` und reaktive Eigenschaften wie `href` und `target`, um eine dynamische und benutzerfreundliche Navigationserfahrung zu bieten.

### props

- href
- target
- displayType

### slots

- icon
- namenloser Slot (\*)

## InputLabel.vue

Diese Vue-Komponente fungiert als flexibles, wiederverwendbares Label-Element für Formulareingaben, das optional einen erklärenden Tooltip (Hilfetext) und ein Warnsymbol anzeigt, um zusätzliche Informationen oder Warnhinweise zu den Formulardaten bereitzustellen. Es unterstützt sowohl eine explizite Textbeschriftung über eine Eigenschaft als auch benutzerdefinierten Slot-Inhalt für vielseitige Beschriftungsmöglichkeiten. Zudem wird bei Vorhandensein eines Hilfstextes automatisch ein Tooltip aktiviert, der den Text informativ und zugänglich macht, während das Warnsymbol (ein Ausrufezeichen im Kreis) visuell auf wichtige Hinweise hinweist.

### props

- name
- label
- helptext

## InputLoading.vue

Diese Vue-Komponente stellt eine Ladeanzeige dar, die sichtbar wird, wenn der `loading` Zustand aktiv ist. Sie nutzt ein animiertes SVG als Lade-Symbol, welches durch seine Drehbewegung eine visuelle Rückmeldung über den laufenden Prozess gibt, und zeigt neben dem Symbol einen Text an, der durch die `loadingText` Prop bereitgestellt wird. Diese Komponente ist hilfreich, um Nutzern eine sofortige Rückmeldung zu geben, dass ihre Anfrage verarbeitet wird, und kann in verschiedenen Teilen einer Anwendung verwendet werden, wo Ladezeiten erwartet werden.

### pops

- loading
- loadingText

## InputSelect.vue

Diese Vue-Komponente ist ein wiederverwendbares und stilvolles Dropdown-Auswahlelement (select), das Optionen aus einer dynamischen Quelle (entweder ein Array oder ein Objekt) präsentiert und die ausgewählte Option an übergeordnete Komponenten mittels einer Zwei-Wege-Bindung kommuniziert. Die Optionen können sowohl als Arrays von Arrays, mit dem Wert als erstes Element und dem Anzeigetext als zweites, oder als Objekt, wobei der Schlüssel dem Wert und der Wert dem Anzeigetext entspricht, übergeben werden.

### props

- modelValue
- options
- sortColumn

### emits

- update:modelValue

## InputSubtitle.vue

Diese Vue-Komponente dient als Untertitel-Element innerhalb von Formularen oder anderen UI-Segmenten. Sie zeigt einen Text an, der entweder durch eine Property (`title`) bereitgestellt oder direkt über einen Slot eingefügt werden kann. Die Komponente ermöglicht es, entweder den Property-Wert oder benutzerdefinierten Inhalt dynamisch anzuzeigen, je nachdem, ob `title` gesetzt ist. Dies macht die Komponente flexibel und einfach in verschiedenen Kontexten einsetzbar, um zusätzliche Informationen oder Überschriften in einer ansprechenden und strukturierten Weise zu präsentieren.

### props

- title

## InputTextarea.vue

Diese Vue-Komponente ist ein vielseitiges, mehrzeiliges Texteingabefeld (textarea), das für umfangreichere Texteingaben in Formularen gedacht ist. Es unterstützt die Zwei-Wege-Datenbindung mittels v-model (hier implementiert durch das Senden von update:modelValue bei jedem Eingabeereignis), wodurch es sich ideal für Formulare eignet, die längere Benutzereingaben erfordern, wie Kommentare, Beschreibungen oder andere Textformate.

### props

- name
- modelValue
- placeholder
- rows

### emits

- update:modelValue

## InputWhiteButton.vue

Diese Vue-Komponente ist ein anpassbarer, stilvoller Weiß-Hintergrund-Button für Formulare oder andere UI-Interaktionen, der verschiedene Inhalte über Slots aufnehmen kann und grundlegende Zustände wie Fokus und Deaktivierung unterstützt.

### props

- type

### slots

- namenloser Slot (\*)

</details>

<details>
<summary>Application/Components/List</summary>

## ListContainer.vue

Diese Vue-Komponente ist ein umfangreiches interaktives Listen-Display, das Optionen zur Suche, Pagination, und Bearbeitung von Datenzeilen bietet und zudem Funktionen wie Erstellung, Anzeige und Änderung von Datensätzen durch eingebettete Buttons unterstützt, komplett mit eingebauten Fehleranzeigen und dynamischen Inertia.js-Routen zur Handhabung der Navigation.

### props

- withinAccordion
- title
- rowId
- datarows
- noEntries
- filters
- routeIndex
- routeParamName
- routeParamValue
- searchFilter
- searchText
- showOn
- routeShow
- editOn
- routeEdit
- createOn
- routeCreate
- showDescription
- editDescription
- errors

### slots

- button
- header
- datarow

## Pagination.vue

Diese Vue-Komponente implementiert eine anpassbare Paginationsleiste für Listen oder Tabellen, die dynamische Links (vorherige, nächste und direkte Seitenzahlen) unterstützt, um durch Inhalte zu navigieren, wobei visuelles Feedback durch aktive Zustände und Hover-Effekte bereitgestellt wird. Die Komponente verwendet Inertia.js für clientseitiges Routing und zeigt Links entweder als aktiv oder deaktiviert an, abhängig von ihrer Verfügbarkeit.

### props

- links

### emits

- list-container-search-reset

## SearchFilter.vue

Diese Vue-Komponente ist ein Suchfilter-Widget, das eine benutzerfreundliche Suchleiste mit integriertem Suchsymbol und einer Schaltfläche zum Zurücksetzen der Suche bietet. Die Suchleiste ermöglicht es Benutzern, Eingaben zu machen, die über das Event `update:modelValue` an die übergeordnete Komponente weitergeleitet werden, um reaktive Suchfunktionalitäten zu ermöglichen. Der "Suche zurücksetzen"-Button löst das `reset`-Event aus, um die Suche zu löschen und die Eingaben zurückzusetzen, wobei auch visuelle Rückmeldungen über den aktuellen Suchstatus angezeigt werden. Die Komponente ist sowohl für helle als auch dunkle Modi gestaltet und bietet eine klare und effektive Benutzeroberfläche für Suchoperationen.

### props

- modelValue
- placeholder
- searchText

### emits

- update:modelValue
- reset

</details>

<details>
<summary>Application/Components/Logo</summary>

## Favicon.vue

Favion im SVG-Format

## Logo.vue

Logo im SVG-Format.

</details>

<details>
<summary>Application/Homepage/Shared</summary>

## BlogPreviewBig.vue

Diese Vue-Komponente dient als ansprechend gestaltete Vorschau für Blog-Beiträge auf der Startseite. Sie verwendet eine `Link`-Komponente zur Navigation, zeigt ein Bild des Blogs, die Kategorie, den Titel, das Veröffentlichungsdatum, den Autor, eine Zusammenfassung des Inhalts und die geschätzte Lesezeit an. Die Komponente ist sowohl für helle als auch dunkle Designs optimiert und strukturiert die Inhalte in einer Grid-Anordnung, um eine visuell ansprechende Darstellung zu bieten. Zusätzliche interaktive Features wie Unterstreichungen bei Hover-Zuständen verbessern die Benutzererfahrung. Eingebundene Unter-Komponenten für Datum und Zahlenformatierung (Lesezeit) verleihen der Darstellung zusätzliche Klarheit und Nutzerfreundlichkeit.

### props

- blog

## BlogPreviewSmall.vue

Diese Vue-Komponente ist eine kompakte Darstellung für Blog-Beiträge, entworfen für die Anzeige auf der Startseite. Sie integriert ein anklickbares Element, das zu einer detaillierteren Blogseite führt, und präsentiert ein Bild, Kategorie, Titel, Veröffentlichungsdatum und Autor des Blogs, sowie eine kurze Zusammenfassung und die geschätzte Lesezeit. Der Designansatz ist benutzerfreundlich, mit klaren visuellen Abgrenzungen und responsive Design für eine ansprechende Darstellung auf verschiedenen Geräten. Zudem betonen interaktive Elemente wie Hover-Unterstreichungen die Bedienbarkeit, und die Komponenten `DisplayDate` und `DisplayNumber` bieten zusätzliche, formatierte Informationen.

### props

- blog

## BlogShow.vue

- blog
- blogarticle

## Layout.vue

Diese Vue-Komponente repräsentiert ein umfassendes Webseiten-Layout für eine Homepage, das Meta-Tags für SEO, eine navigierbare Kopfzeile, ein Inhaltsbereich, und einen Fußbereich integriert. Es enthält dynamische Elemente wie ein schaltbares Menü für mobile Ansichten, Meta-Informationen für verbesserte Suchmaschinenoptimierung, Links für soziale Medien und einen Mechanismus zum Umschalten zwischen verschiedenen Betriebsmodi (z.B. dunkel und hell). Zusätzlich bietet es interaktive Features wie eine dynamische Jahresangabe und Versionsinformation im Footer, sowie einen Button zum Zurücksetzen von Cookie-Einstellungen.

### props

- headerTitle
- headerDescription
- headerUrl
- headerImage
- noIndexNoFollow

### slots

- namenloser Slot (\*)

## MetaHeader.vue

Diese Vue-Komponente ist speziell dafür entwickelt, um die Meta-Informationen einer Webseite innerhalb eines Inertia.js-Vue-Projekts zu verwalten. Sie verwendet die `Head`-Komponente von Inertia.js, um den Titel der Webseite zu setzen und erlaubt es, benutzerdefinierte Meta-Tags für Suchmaschinen-Optimierung (SEO), Open Graph und Twitter Cards über benannte Slots einzubinden. Die Flexibilität des Slot-Systems ermöglicht es Entwicklern, Meta-Tags spezifisch und bedingungsgerecht zu platzieren, um die Sichtbarkeit und Auffindbarkeit der Seite in sozialen Medien und Suchmaschinen zu verbessern. Die Standardtitel-Prop bietet einen generischen Willkommensgruß, der überschrieben werden kann, um relevante SEO- und benutzerfreundliche Informationen bereitzustellen.

### props

- title

### slots

- robots
- description
- opengraph
- twitter

</details>

<details>
<summary>Application/Shared</summary>

## BrandFooter.vue

Diese Vue-Komponente ist ein wiederverwendbares Fußzeilen-Branding-Element, das eine visuelle Darstellung einer Marke oder eines Unternehmens bietet. Es nutzt eine Kombination aus Favicon, markenspezifischen Texten und optional einem Anwendungsnamen, um Nutzern eine klare Identifizierung der Website zu ermöglichen. Die Komponente verwendet die `Link`-Komponente von Inertia.js, um eine navigierbare Verbindung zur Hauptseite oder einer anderen spezifischen Route zu schaffen, und setzt dabei auf eine ansprechende und funktional gestaltete visuelle Präsentation.

### props

- routeName
- brand_1
- brand_2
- appName

## BrandHeader.vue

Diese Vue-Komponente stellt eine Kopfzeile für eine Webseite dar, die ein Favicon und eine zweiteilige Markenbezeichnung kombiniert, ergänzt durch den optionalen Namen einer Anwendung. Sie ist so gestaltet, dass sie auf kleineren Bildschirmen minimalistisch erscheint und auf größeren Displays zusätzliche Informationen bietet. Die Komponente verwendet die `Link`-Komponente von Inertia.js für die Navigation, was die Integration in SPA (Single Page Application)-Umgebungen erleichtert. Das Layout ist responsiv, mit Beschriftungselementen, die nur auf größeren Bildschirmen sichtbar sind, und stellt eine klare und professionelle Darstellung der Marke oder des Unternehmens sicher.

### props

- routeName
- brand_1
- brand_2
- appName

## ConfirmsPassword.vue

Diese Vue-Komponente implementiert eine Passwortbestätigungs-Funktion, die oft vor sicherheitskritischen Aktionen benötigt wird. Sie benutzt ein Dialogfenster (DialogModal), um den Nutzer zur Eingabe seines Passworts aufzufordern, bevor er fortfahren kann. Die Komponente wird durch Klicken auf einen Slot-Element aktiviert und zeigt das Dialogfenster mit einem Passwortfeld und entsprechenden Steuerelementen an.

### props

- title
- content
- button

### slots

- namenloser Slot (\*)

### emits

- confirmed

## DeleteUserForm.vue

Diese Vue-Komponente ermöglicht es Benutzern, ihr Konto über ein interaktives Formular dauerhaft zu löschen, indem sie ihre Entscheidung in einem Bestätigungsdialog mit Passworteingabe validieren müssen, bevor der Löschvorgang über eine API-Anfrage durchgeführt wird.

## LinkFooter.vue

Diese Vue-Komponente stellt einen wiederverwendbaren Link oder ein Textelement für Fußzeilen dar, wobei das Verhalten davon abhängt, ob eine Route angegeben ist. Ist eine Route spezifiziert, wird ein anklickbarer Link angezeigt; ist keine Route angegeben, wird stattdessen ein einfacher Textblock gerendert. Beide Optionen bieten stilistische Hover-Effekte und sind für dunkle und helle Themen optimiert.

### props

- routeName
- name

### slots

- namenloser Slot (\*)

## LinkHeader.vue

Diese Vue-Komponente ermöglicht es, entweder einen interaktiven Link oder einen statischen Textblock im Kopfbereich einer Webseite zu rendern. Wenn eine Route angegeben ist, wird der Text als klickbarer Link dargestellt; andernfalls wird er als einfacher Textblock ohne Verlinkung ausgegeben. Beide Varianten sind gestalterisch mit Rundungen, Hover-Effekten und Anpassungen für helle und dunkle Modi versehen, wodurch sie flexibel und ansprechend für verschiedene Designanforderungen sind.

### props

- routeName
- name

### slots

- namenloser Slot (\*)
-

## LogoutOtherBrowserSessionsForm.vue

Diese Vue-Komponente ermöglicht Benutzern, sich von allen anderen Browser-Sitzungen auf unterschiedlichen Geräten abzumelden. Sie bietet eine detaillierte Auflistung aktiver Sitzungen, einschließlich Informationen über das verwendete Gerät, den Browser und die IP-Adresse. Zusätzlich ist eine Funktion integriert, die eine Bestätigung durch Eingabe des aktuellen Passworts erfordert, bevor der Benutzer sich von diesen Sitzungen abmelden kann. Dies erhöht die Sicherheit, indem sichergestellt wird, dass die Aktion vom Kontoinhaber ausgeführt wird. Das Layout ist in einem formulargestützten Abschnitt organisiert, der es Benutzern erleichtert, ihre Sitzungen zu verwalten und bei Bedarf Sicherheitsmaßnahmen zu ergreifen.

### props

- sessions

## Profile.vue

Diese Vue-Komponente dient als umfassendes Benutzerprofil-Verwaltungsdashboard, das es Benutzern ermöglicht, ihre Profilinformationen zu aktualisieren, ihr Passwort zu ändern, die Zwei-Faktor-Authentifizierung zu verwalten und sich von anderen Browsersitzungen abzumelden. Zusätzlich können Benutzer, falls aktiviert, ihr Konto löschen. Die Seite zeigt dynamisch Abschnitte basierend auf den Berechtigungen des Benutzers und den im System aktivierten Funktionen (verwaltet durch das `$page.props.jetstream`-Objekt) an. Jede Funktionalität ist in ihrer eigenen Komponente gekapselt, was Modularität und Wiederverwendbarkeit fördert. Die Komponente `SectionBorder` wird zwischen den Abschnitten verwendet, um eine visuell strukturierte Gestaltung zu ermöglichen, die die Benutzeroberfläche durch klare Trennung verschiedener Einstellungsbereiche verbessert.

### props

- sessions
- confirmsTwoFactorAuthentication

## TwoFactorAuthenticationFor.vue

Diese Vue-Komponente ermöglicht es Benutzern, die Zwei-Faktor-Authentifizierung zu verwalten, indem sie die Aktivierung, Bestätigung, Deaktivierung und Wiederherstellungscodes der Zwei-Faktor-Authentifizierung steuert und anzeigt.

### props

- requiresConfirmation

## UpdatePasswordForm.vue

Diese Vue-Komponente ermöglicht es dem Benutzer, sein Passwort zu aktualisieren, indem sie ein Formular bereitstellt, das das aktuelle Passwort sowie das neue Passwort und dessen Bestätigung erfasst und an die Server-Route zur Passwortaktualisierung sendet.

## UpdateProfileInformationForm.vue

### props

- user

</details>

(\*)
In Vue.js, einem JavaScript-Framework, das du zusammen mit Laravel für dein Webprojekt verwenden kannst, beziehen sich „Slots“ auf eine Methode, um Inhalte an eine Komponente zu übergeben. Ein „namenloser Slot“ ist ein Standard-Slot, der verwendet wird, um beliebigen Inhalt in eine Komponente einzufügen, ohne dass ein spezifischer Name dafür definiert wird. Das ist besonders nützlich, wenn eine Komponente als Container dient oder wenn die Flexibilität erforderlich ist, unterschiedliche Inhalte einzuschleusen.

In der Praxis sieht das so aus: Du definierst eine Komponente mit einem Slot, aber ohne diesen explizit zu benennen. Wenn du dann diese Komponente irgendwo in deiner Anwendung verwendest, kannst du beliebige Inhalte in den Slot einfügen. Hier ist ein einfaches Beispiel:

```vue
<!-- MyComponent.vue -->
<template>
    <div>
        <slot></slot>
        <!-- Das ist der namenlose Slot -->
    </div>
</template>
```

Und dann könntest du die Komponente so verwenden:

```vue
<my-component>
  <p>Dieser Text wird in den namenlosen Slot von MyComponent eingefügt.</p>
</my-component>
```

Dieser Ansatz ermöglicht es dir, deine Komponenten flexibel und wiederverwendbar zu gestalten, indem du unterschiedliche Inhalte nach Bedarf einfügst.
