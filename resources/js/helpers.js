import axios from 'axios';

export async function loadRightsOnce() {
  if (!cache.tables) {
    try {
      const res = await axios.get('/api/admin/tables');
      // Überprüfen, ob die Antwort tatsächlich ein Array ist
      if (Array.isArray(res.data)) {
        cache.tables = res.data;
      } else {
        console.error('Unerwartetes Format für Tabellen:', res.data);
        cache.tables = [];
      }
    } catch (error) {
      console.error('Fehler beim Laden der Tabellen:', error);
      cache.tables = [];
    }
  }

  if (!cache.rights) {
    try {
        const uid = await GetAuth();
     if(!uid){
        return 0;
     }
        const res = await axios.get('/api/user/rights/' + uid);
      // Überprüfen, ob die Antwort tatsächlich ein Objekt ist
      if(res.data == "0")
      {
        return 0;
      }
      if (typeof res.data === 'object') {
        cache.rights = res.data;
      } else {
        console.error('Unerwartetes Format für Rechte:', res.data);
        cache.rights = {};
      }
    } catch (error) {
      console.error('Fehler beim Laden der Rechte2:', error);
      cache.rights = {};
    }
  }
}


const cache = {
  tables: null,
  rights: null,
  ready: false,
};
export function replaceSmilies(text) {
    const smilies = {
      ";)": "wink",
      ":D": "biggrin",
      ":)": "smile",
      ":o": "surprised",
      ":shock:": "eek",  // letzte Definition zählt im PHP-Array
      ":?": "confused",
      " 8)": "cool",
      ":lol:": "lol",
      ":x": "mad",
      ":P": "razz",
      ":mrgreen:": "mrgreen",
      ":mcsl:":"mcsl",
      ":arrow:": "arrow",
      ":cry:": "cry",
      ":evil:": "evil",
      ":!:": "exclaim",
      ":{": "frown",
      ":idea:": "idea",
      ":|": "neutral",
      ":question:": "question",
      ":shy:": "redface",
      ":roll:": "rolleyes",
      ":(": "sad",
      "^^": "twisted",
      ":diso:": "disor",
      ":bankrob:": "bankrob",
      ":jesus:": "jesus",
      ":cyborg:": "cyborg",
      ":pirat:": "pirat",
      ":blade:": "blade",
      ":drugs:": "drugs",
      ":ying:": "ying",
      ":skull:": "skull",
      ":bomb:": "bomb",
      ":kiss:": "kiss",
      ":holy:": "holy"
    };

    // Ersetze jedes Smiley durch das entsprechende <img>
    for (const [key, value] of Object.entries(smilies)) {
      const escapedKey = key.replace(/[-/\\^$*+?.()|[\]{}]/g, '\\$&'); // für Regex escapen
      const regex = new RegExp(escapedKey, 'g');
      const img = `<img src="/images/smilies/icon_${value}.gif" alt="${key}" class="inline" />`;
      text = text.replace(regex, img);
    }

    return text;
  }

export async function initRights() {
  if (!cache.ready) {
    const [tablesRes, rightsRes] = await Promise.all([
      axios.get('/api/admin/tables'),
      axios.get('/api/user/rights'),
    ]);

    cache.tables = tablesRes.data;
    cache.rights = rightsRes.data;
    cache.ready = true;
  }
}

// export function GetRights(type, table) {
//   if (!cache.ready) return 0;

//   const t = cache.tables.find(t => t.name === table);
//   if (!t) return 0;

//   const str = cache.rights[type];
//   if (!str) return 0;

//   return str.charAt(t.position) === '1' ? 1 : 0;
// }
 export async function GetRights(right,table)
 {
    const res = axios.get('/api/user/rights/des/' + table + "/" + right);
    const res2 = res.data;
    return res2;
 }
// export async function GetRights(rightType, tableName) {
//   await loadRightsOnce();
//   if(!GetAuth()){
//     return 0;
//   }
//     if(!rightType)
//     {
//         return 0;
//     }
//   // Überprüfen, ob die Tabellen als Array vorhanden sind
//   if (!Array.isArray(cache.tables)) {
//     console.error('Tabellen-Daten sind nicht im erwarteten Format');
//     return 0;
//   }

//   const table = cache.tables.find(t => t.name === tableName);
//   if (!table) {
//     console.error(`Tabelle mit dem Namen "${tableName}" nicht gefunden.`);
//     return 0;
//   }

//   const rightString = cache.rights?.[rightType];
//   if (!rightString) {
//     // console.error(`Rechttyp "${rightType}" nicht gefunden.`);
//     return 0;
//   }

//   return rightString.charAt(table.position) === '1' ? 1 : 0;
// }

// // resources/js/services/rightsService.js
// import axios from 'axios';

// const cache = {
//   tables: null,
//   rights: null,
// };

// export async function loadRightsOnce() {
//   if (!cache.tables) {
//     const res = await axios.get('/api/admin/tables');
//     cache.tables = res.data;
//   }
//   if (!cache.rights) {
//     const res = await axios.get('/api/user/rights');
//     cache.rights = res.data;
//   }
// }

// export async function GetRights(rightType, tableName) {
//   await loadRightsOnce();

//   const table = cache.tables.find(t => t.name === tableName);
//   if (!table) return 0;

//   const rightString = cache.rights[rightType];
//   if (!rightString) return 0;

//   return rightString.charAt(table.position) === '1' ? 1 : 0;
// }
// // helper.js
// import axios from 'axios';

// export async function GetRights(rightType, tableName) {
//   try {
//     // Lade Tabellen (inkl. Position)
//     const tablesRes = await axios.get('/api/admin/tables');
//     const table = tablesRes.data.find(t => t.name === tableName);
//     if (!table) return 0;

//     // Lade Rechte des Users
//     const rightsRes = await axios.get('/api/user/rights');
//     const rightString = rightsRes.data[rightType];
//     if (!rightString) return 0;

//     // Prüfe die Position
//     return rightString.charAt(table.position) === '1' ? 1 : 0;
//   } catch (e) {
//     console.error('Fehler bei GetRights:', e);
//     return 0;
//   }
// }
// export async function loadAllRights() {
//   try {
//     const response = await axios.get('/api/user/rights');
//     return response.data;
//   } catch (error) {
//     console.error('Fehler beim Laden der Rechte:', error);
//     return null;
//   }
// }

// export async function GetRights(tableName, rightType) {
//   try {
//     // Lade Tabellen mit Positionen
//     const tablesResponse = await axios.get('/api/admin/tables');
//     const tables = tablesResponse.data;

//     const targetTable = tables.find(t => t.name === tableName);
//     if (!targetTable) {
//       console.warn(`Tabelle "${tableName}" nicht gefunden.`);
//       return false;
//     }

//     const position = targetTable.position;

//     // Lade Benutzerrechte
//     const rights = await loadAllRights();
//     if (!rights || !rights[rightType]) {
//       console.warn(`Rechttyp "${rightType}" nicht gefunden.`);
//       return false;
//     }

//     // Bitweise Rechte prüfen
//     return rights[rightType].charAt(position) === '1';
//   } catch (err) {
//     console.error('Fehler beim Prüfen des Rechts:', err);
//     return false;
//   }
// }

// export async function GetRights(tableName, rightType) {
//     try {
//         const uid = GetAuth();
//       // Schritt 1: Lade alle Tabellen (mit Positionen)
//       const tablesResponse = await axios.get('/admin/tablesR/' + uid);
//       const tables = tablesResponse.data;

//       const targetTable = tables.find(t => t.name === tableName);
//       if (!targetTable) {
//         console.error(`Tabelle "${tableName}" nicht gefunden.`);
//         return false;
//       }

//       const position = targetTable.position;

//       // Schritt 2: Lade Rechte
//       const rightsResponse = await axios.get('/api/GetRights');
//       const rights = rightsResponse.data;

//       const rightString = rights[rightType];
//       if (!rightString) {
//         console.error(`Rechttyp "${rightType}" nicht gefunden.`);
//         return false;
//       }

//       // Schritt 3: Prüfe die Position
//       const bit = rightString.charAt(position);
//       return bit === '1';

//     } catch (error) {
//       console.error('Fehler beim Prüfen des Rechts:', error);
//       return false;
//     }
//   }
export function CleanId() {
    const path = window.location.pathname; // Beispiel: "/admin/tables/show/123"
    let segments = path.split('/');

    for (let i = 0; i < segments.length; i++) {
        if (!isNaN(segments[i]) && segments[i].trim() !== "") { // Ist es eine Zahl?
            return segments[i]; // Erste gefundene ID zur�ckgeben
        }
    }

    return null; // Falls keine ID gefunden wird
}
export function CleanTable() {
    const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zur�ck
    let segments = path.split('/');
    const fo_vals = ["admin", "tables", "edit", "delete", "create", "show","search","home","pictures"];

    // Gehe alle Segmente durch und entferne die nicht gew�nschten
    for (let i = 0; i < segments.length; i++) {
        if (fo_vals.includes(segments[i])) {
            segments.splice(i, 1); // Entfernt das Element an Index i
            i--; // Reduziere den Index, da das Array nun verkleinert wurde
        } else if (!isNaN(segments[i])) { // �berpr�ft, ob es eine Zahl ist
            segments.splice(i, 1);
            i--; // Reduziere den Index
        }
    }
segments = segments.join('').replace(/[\[\]']/g, '');

    // Die bereinigte URL (optional)
    return segments;

}
export function ucf(str) {
    // Teilt den String an den Unterstrichen
    const arr = str.split("_");

    // Wandelt jedes Element des Arrays um, falls es mehr als ein Wort gibt
    const na = arr.map(
        (val) => val.charAt(0).toUpperCase() + val.slice(1).toLowerCase(),
    );

    // Setzt die W�rter mit einem Leerzeichen zusammen
    return na.join(" ");
}

export function CleanTable_alt() {
    const path = window.location.pathname; // Gibt "/admin/tables/show/Example" zur�ck
    let segments = path.split('/');
    const fo_vals = ["admin", "tables", "edit", "delete", "create", "show","search","home"];

    // Gehe alle Segmente durch und entferne die nicht gew�nschten
    for (let i = 0; i < segments.length; i++) {
        if (fo_vals.includes(segments[i])) {
            segments.splice(i, 1); // Entfernt das Element an Index i
            i--; // Reduziere den Index, da das Array nun verkleinert wurde
        } else if (!isNaN(segments[i])) { // �berpr�ft, ob es eine Zahl ist
            segments.splice(i, 1);
            i--; // Reduziere den Index
        }
        else if (segments[i] == "pictures")
        {
            return "images";
        }
    }
segments = segments.join('').replace(/[\[\]']/g, '');

    // Die bereinigte URL (optional)
    return segments;

}
export async function Authy(){
    GetAuth().then(authenticated => {
        if (authenticated === "false") {
            alert("TO LOGIN");
            location.href = "/login";
            return false;
        }
        return true;
    });
}
import {route} from 'ziggy-js';

export async function GetAuth()
{
    try {
        const response = await fetch('/GETUserID');
        const data = await response.json();
        // console.log("DATA: " + data);
        return !!data;
    } catch (error){
        console.error("Fehler bei der Authentifizierung",error);
    }
}
export async function checkAuthAndRedirect() {
    try {
        const response = await fetch('/GetAuth');
        const data = await response.json();
        // console.log("?? Auth-Status:", data); // Debugging
        return data === "true" ? "authenticated" : "login";
    } catch (error) {
        console.error("? Fehler beim Abrufen der Authentifizierung:", error);
        return "login"; // Falls ein Fehler auftritt, leite lieber um
    }
}
export async function GetSettings() {
    try {
        const response = await fetch('/api/settings');
        const data = await response.json();

        const settings = {};

        // Alle Arrays (label, headline, test...) direkt zuweisen
        Object.keys(data).forEach((key) => {
            settings[key] = data[key];
        });
        // console.log("SET:" + settings);
        return settings;
    } catch (error) {
        console.error("Fehler beim Laden der Settings:", error);
        return {};
    }

}
// export async function GetSRights(modul)
// {
//     try {
//         const response = await fetch('/api/GetSRights/' + modul);
//         const data = await response.json();
//         if(data.sright)
//         {
//             return true;
//         }
//         return false;




//     } catch (error) {
//         console.error("Fehler beim Laden der Settings:", error);
//         return {};
//     }
// }
let cachedRights = null;

export async function loadRights() {
  if (cachedRights) return cachedRights;

  const res = await axios.get('/api/GetSRights/');
  cachedRights = res.data.rights;
  return cachedRights;
}

export function GetSRights(modul) {
    return cachedRights?.[modul] === true;
}
export function rumLaut(input, table = '') {
    let str = input;
    if(!str){
        return "";
    }
    // 1. Regex: Entferne <br> nach </li> und vor <li>
    str = str.replace(/<\/li>\s*<br\s*\/?>/gi, '</li>');
    str = str.replace(/<li>\s*<br\s*\/?>/gi, '<li>');

    // 2. <br> vor <h2>/<h3>/<p> und danach entfernen
    str = str.replace(/<br\s*\/?>\s*(<(h2|h3|p)[^>]*>)/gi, '$1');
    str = str.replace(/(<\/(h2|h3|p)>)\s*<br\s*\/?>/gi, '$1');

    // 3. Für bestimmte Tabellen: <p>, </p> und <br /> entfernen
    if (table === 'shortpoems' || table === 'didyouknow') {
        str = str.replace(/<p>/gi, '');
        str = str.replace(/<\/p>/gi, '');
        str = str.replace(/<br\s*\/?>/gi, '');
    }
    str = str.replace('%5B', '[').replace('%5D', ']')
    // 4. Zeichen ersetzen
    str = str.replace(/â€“/g, '-');

    // 5. HTML Entities dekodieren (basic)
    const txt = document.createElement("textarea");
    txt.innerHTML = str;
    str = txt.value;

    // 6. Weitere manuelle Zeichenersetzungen
    const find = [
        /---/g, /ÃƒÅ“/g, /ÃƒÂ¼/g, /ÃƒÅ¸/g, /Ãƒ\?/g, /ÃƒÂ¤/g, /â€™/g, /Ã„/g,
        /Ãœ/gi, /Ã/g, /Ã¶/g, /Ã"Y/g, /Ã¼/g, /Ã¤/g, /ÃŸ/g, /âEUR¦/g, /ÃƒÂ¶/g,/Â§/gi,/Â©/gi, /Ã/gi
    ];

    // const replace = [
    //     '<hr>', '&Uuml;', '&uuml;', '&szlig;', '&szlig;', '&auml;', "'", '&Auml;',
    //     '&Uuml;', '&szlig;', '&ouml;', '&Uuml;', '&uuml;', '&auml;', '&szlig;', '…', '&Auml;', '&ouml;'
    // ];
    const replace = [
        '<hr>', 'Ü', 'ü', 'ß', 'ß', 'ä', "'", 'Ä',
        'Ü', 'ß', 'ö', 'Ü', 'ü', 'ä', 'ß', '…', 'ö','§',"©",'ß'
    ];
    find.forEach((regex, i) => {
        str = str.replace(regex, replace[i]);
    });
    str = replaceSmilies(str);
    return str;
}

export const selectionHelper = {
//   savedRange: null,

  save() {
    const sel = window.getSelection();
    if (sel && sel.rangeCount > 0) {
      this.savedRange = sel.getRangeAt(0).cloneRange();
      console.log(this.savedRange);
    }
  },

  restore() {
    const sel = window.getSelection();
    sel.removeAllRanges();
    if (this.savedRange) {
      sel.addRange(this.savedRange);
    }
	else{
	console.log(this);
	}
  },
};


/**
 * stripTags(text, allowed = [])
 * @param {String} text      – Eingabestring (kann HTML enthalten)
 * @param {String[]|String} allowed – Array oder kommaseparierte Liste erlaubter Tags (ohne < >)
 * @returns {String} – text ohne verbotene Tags
 */
export function stripTags(text, allowed = []) {
  if (!text) return '';

  // in Array umwandeln (z. B. "b,i" → ["b","i"])
  const allow = Array.isArray(allowed)
    ? allowed
    : (allowed || '').split(',').map(t => t.trim().toLowerCase());

  // Kurzer Weg ohne Whitelist: alles killen
  if (!allow.length) return text.replace(/<\/?[^>]+>/gi, '');

  // RegExp:  <tag ...> oder </tag>
  return text.replace(/<\/?([a-z][a-z0-9]*)\b[^>]*>/gi, (match, tag) =>
    allow.includes(tag.toLowerCase()) ? match : ''
  );
}
