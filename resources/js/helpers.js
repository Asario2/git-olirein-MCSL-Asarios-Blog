export function CleanTable() {
    const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zurück
    let segments = path.split('/');
    const fo_vals = ["admin", "tables", "edit", "delete", "create", "show","search","home","pictures"];

    // Gehe alle Segmente durch und entferne die nicht gewünschten
    for (let i = 0; i < segments.length; i++) {
        if (fo_vals.includes(segments[i])) {
            segments.splice(i, 1); // Entfernt das Element an Index i
            i--; // Reduziere den Index, da das Array nun verkleinert wurde
        } else if (!isNaN(segments[i])) { // Überprüft, ob es eine Zahl ist
            segments.splice(i, 1);
            i--; // Reduziere den Index
        }
    }
segments = segments.join('').replace(/[\[\]']/g, '');
    console.log(segments);
    // Die bereinigte URL (optional)
    return segments;

}
export function CleanId() {
    const path = window.location.pathname; // Beispiel: "/admin/tables/show/123"
    let segments = path.split('/');

    for (let i = 0; i < segments.length; i++) {
        if (!isNaN(segments[i]) && segments[i].trim() !== "") { // Ist es eine Zahl?
            console.log("ID gefunden:", segments[i]);
            return segments[i]; // Erste gefundene ID zurückgeben
        }
    }

    return null; // Falls keine ID gefunden wird
}

