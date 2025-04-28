// utils/rights.js

let userRights = {};
let adminTablePositions = {}; // Umgewandelt von Array zu Objekt
let rightsReady = false;

export async function loadAllRights() {
  const [rightsRes, tablesRes] = await Promise.all([
    axios.get('/api/user/rights'),
    axios.get('/api/admin_table_positions'),
  ]);

  userRights = rightsRes.data[1];

  // Umwandeln von adminTablePositions von Array zu Objekt
  adminTablePositions = tablesRes.data[1].reduce((acc, item) => {
    acc[item.name] = item.position;
    return acc;
  }, {});

//   console.log('✅ userRights:', userRights);
//   console.log('✅ adminTablePositions:', adminTablePositions);

  rightsReady = true;
}
import { CleanTable, CleanId } from '@/helpers';
export function hasRight(right, table) {
  if (!userRights || !adminTablePositions) {
    console.error('❌ Rechte oder Tabellenpositionen noch nicht geladen.');
    return false;
  }
  table = table ?? CleanTable();
  const rightKey = `${right}_table`; // z. B. "view_table"
  const rightsString = userRights[rightKey];
  const position = adminTablePositions[table];

  if (typeof rightsString !== 'string') {
    console.error(`❌ Rechte-String für '${rightKey}' nicht gefunden`);
    return false;
  }

  if (typeof position !== 'number' && typeof position !== "string") {
    console.error(`❌ Position für Tabelle '${table}' nicht gefunden`);
    return false;
  }

  return rightsString.charAt(position) === '1';
}

export function isRightsReady() {
  return rightsReady;
}
