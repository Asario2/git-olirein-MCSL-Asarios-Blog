import axios from "axios";

// Hole das CSRF-Token aus dem Meta-Tag
const token = document.head.querySelector('meta[name="csrf-token"]');

if (token) {
    axios.defaults.headers.common["X-CSRF-TOKEN"] = token.content;
} else {
    console.error("CSRF token not found");
}

// Falls du Axios in Vue verwendest:
export default axios;
