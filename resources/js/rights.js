// import axios from axios
// const response_at = await axios.get(`api/admin/tables`);
      // window.adminTablePositions = response_at.data.at;
// const response_ur = await axios.get(`api/user/rights`);
      // window.adminTablePositions = response_ur.data.ur;
// export function hasRight(right, table) {
  // const rights = window.userRights || {};
  // const positions = window.adminTablePositions || {};
  // const index = positions[table];

  // if (index === undefined || !rights[right + '_table']) return false;

  // const binString = rights[right + '_table'];
  // return binString.charAt(index) === '1';
// }
import { GetRights } from '@/helpers.js		' // Pfad anpassen falls nötig

export default {
  async mounted(el, binding) {
    const [right, table] = binding.value;

    const hasRight = await GetRights(right, table);

    if (!hasRight) {
      el.parentNode && el.parentNode.removeChild(el); // Element entfernen wenn kein Recht
    }
  }
}	