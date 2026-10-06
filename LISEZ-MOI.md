# Dressa — fabriquer l'APK

Ce dossier contient tout : le site (`www/`), les icônes et écrans de démarrage (`assets/`), la configuration Capacitor et la construction automatique.

## Option 1 — Sans rien installer (GitHub)
1. Créez un dépôt GitHub gratuit et envoyez-y tout ce dossier (y compris `.github`).
2. Onglet **Actions › Construire l'APK › Run workflow**.
3. Après environ 5 min, téléchargez **Dressa-APK** (`app-debug.apk`) et installez-le sur le téléphone (autoriser les sources inconnues).

## Option 2 — Sur votre ordinateur
Prérequis : Node 20, JDK 17, Android Studio (SDK).
```
npm install
npx cap add android
bash scripts/patch-android.sh
npx capacitor-assets generate --android
npx cap sync android
cd android && ./gradlew assembleDebug
```
APK : `android/app/build/outputs/apk/debug/app-debug.apk`.

## Notes
- L'application a besoin d'Internet (base Supabase, polices, bibliothèque Supabase chargée depuis un CDN).
- Mise à jour du site : remplacez `www/index.html`, puis relancez la construction.
- Play Store : il faudra un AAB signé (`./gradlew bundleRelease` + votre clé).
- Remplacez `assets/icon-only.png` par votre logo en 1024×1024 pour des icônes plus nettes.
- Pensez à exécuter `MIGRATION_photos_multiples.sql` dans Supabase pour les photos multiples des catalogues.
