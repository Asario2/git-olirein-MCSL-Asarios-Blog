const subdomain = process.env.SUBDOMAIN || 'default';

export default {
    plugins: {
        tailwindcss: `./tailwind.${subdomain}.config.js`,
        autoprefixer: {},
    },
};