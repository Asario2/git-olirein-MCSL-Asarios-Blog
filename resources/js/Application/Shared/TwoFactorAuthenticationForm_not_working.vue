<template>
    <section-form :withTitle="true">
      <template #title> Zwei-Faktor-Authentifizierung </template>
      <template #description>
        Fügen Sie Ihrem Konto zusätzliche Sicherheit hinzu, indem Sie die
        Zwei-Faktor-Authentifizierung verwenden.
      </template>

      <template #form>
        <h3 v-if="twoFactorEnabled && !confirming" class="form_text_h3">
          Sie haben die Zwei-Faktor-Authentifizierung aktiviert.
        </h3>

        <h3 v-else-if="twoFactorEnabled && confirming" class="form_text_h3">
          Aktivierung der Zwei-Faktor-Authentifizierung abschließen.
        </h3>

        <h3 v-else class="form_text_h3">
          Sie haben die Zwei-Faktor-Authentifizierung nicht aktiviert.
        </h3>

        <div v-if="twoFactorEnabled">
          <div v-if="qrCode">
            <div class="form_text_info">
              <p v-if="confirming" class="font-semibold">
                Um die Aktivierung der Zwei-Faktor-Authentifizierung
                abzuschließen, scannen Sie den folgenden QR-Code mit der
                Authentifizierungsanwendung Ihres Smartphones oder geben Sie den
                Einrichtungsschlüssel ein und geben Sie den generierten OTP-Code ein.
              </p>

              <p v-else>
                Die Zwei-Faktor-Authentifizierung ist jetzt aktiviert. Scannen
                Sie den folgenden QR-Code mit der Authentifizierungsanwendung
                Ihres Smartphones oder geben Sie den Einrichtungsschlüssel ein.
              </p>
            </div>

            <div class="form_qr_code" v-html="qrCode" />

            <div v-if="confirming">
              <input-container :full-width="true" class="mt-4">
                <input-label name="code" label="Code"></input-label>
                <input-element
                  type="numeric"
                  name="code"
                  ref="code"
                  v-model="confirmationForm.code"
                ></input-element>
                <input-error
                  :message="confirmationForm.errors.code"
                />
              </input-container>
            </div>
          </div>

          <div v-if="recoveryCodes.length > 0 && !confirming">
            <div class="form_text_info">
              Speichern Sie diese Wiederherstellungscodes in einem sicheren
              Passwort-Manager. Sie können verwendet werden, um den Zugang zu
              Ihrem Konto wiederherzustellen, wenn Ihr Gerät zur
              Zwei-Faktor-Authentifizierung verloren geht.
            </div>

            <div
              class="grid gap-1 max-w-xl mt-4 px-4 py-4 font-mono text-sm bg-layout-sun-100 dark:bg-layout-night-100 dark:text-gray-100 rounded-lg"
            >
              <div v-for="code in recoveryCodes" :key="code">
                {{ code }}
              </div>
            </div>
          </div>
        </div>

        <div class="mt-5">
          <div v-if="!twoFactorEnabled">
            <button-group>
              <confirms-password @confirmed="enableTwoFactorAuthentication">
                <input-button
                  type="button"
                  :class="{ 'opacity-25': enabling }"
                  :disabled="enabling"
                >
                  Aktivieren
                </input-button>
              </confirms-password>
            </button-group>
          </div>

          <div v-else>
            <button-group>
              <confirms-password
                @confirmed="confirmTwoFactorAuthentication"
                v-if="confirming"
              >
                <input-button
                  type="button"
                  class="me-3"
                  :class="{ 'opacity-25': enabling }"
                  :disabled="enabling"
                >
                  Bestätigen
                </input-button>
              </confirms-password>

              <confirms-password
                @confirmed="regenerateRecoveryCodes"
                v-if="recoveryCodes.length > 0 && !confirming"
              >
                <input-button class="me-3">
                  Wiederherstellungs-Codes regenerieren
                </input-button>
              </confirms-password>

              <confirms-password
                @confirmed="showRecoveryCodes"
                v-if="recoveryCodes.length === 0 && !confirming"
              >
                <input-button class="me-3">
                  Wiederherstellungscodes anzeigen
                </input-button>
              </confirms-password>

              <confirms-password
                @confirmed="disableTwoFactorAuthentication"
                v-if="confirming"
              >
                <input-button
                  :class="{ 'opacity-25': disabling }"
                  :disabled="disabling"
                >
                  Abbrechen
                </input-button>
              </confirms-password>

              <confirms-password
                @confirmed="disableTwoFactorAuthentication"
                v-if="!confirming"
              >
                <input-danger-button
                  :class="{ 'opacity-25': disabling }"
                  :disabled="disabling"
                >
                  Deaktivieren
                </input-danger-button>
              </confirms-password>
            </button-group>
          </div>
        </div>
      </template>
    </section-form>
  </template>

  <script>
  import { router } from "@inertiajs/vue3";
  import { useForm } from '@inertiajs/vue3';
  import axios from "axios";

  export default {
  name: "TwoFactorAuthenticationForm",

  data() {
    return {
      enabling: false,
      confirming: false,
      disabling: false,
      qrCode: null,
      recoveryCodes: [],
      confirmationForm: useForm({
        code: "",
      }),
      twoFactorEnabled: false, // Setze den initialen Zustand auf false
    };
  },
  mounted() {
//   console.log("TwoFactorAuthenticationForm Komponente wurde geladen!");
},
  methods: {
    enableTwoFactorAuthentication() {
    //   console.log("Aktivieren Button geklickt");

      this.enabling = true;

      // Anfrage zum Aktivieren der Zwei-Faktor-Authentifizierung
      axios
        .post(route("two-factor.enable"))
        .then(() => {
          this.showQrCode();
          this.showRecoveryCodes();
          this.confirming = true; // Bestätigung des OTP-Codes
        })
        .catch((error) => {
          console.error("Fehler beim Aktivieren der Zwei-Faktor-Authentifizierung:", error);
        })
        .finally(() => {
          this.enabling = false;
        });
    },

    showQrCode() {
      axios.get(route("two-factor.qr-code")).then((response) => {
        this.qrCode = response.data.svg;
      });
    },

    showRecoveryCodes() {
      axios.get(route("two-factor.recovery-codes")).then((response) => {
        this.recoveryCodes = response.data;
      });
    },

    confirmTwoFactorAuthentication() {
      this.confirmationForm.post(route("two-factor.confirm_alt"), {
        errorBag: "confirmTwoFactorAuthentication",
        onSuccess: () => {
          this.confirming = false;
          this.qrCode = null;
          this.twoFactorEnabled = true; // Setze auf true, wenn erfolgreich aktiviert
        },
      });
    },
  },
};
</script>
