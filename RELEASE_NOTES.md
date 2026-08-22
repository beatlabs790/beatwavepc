# BeatWave v2.0.0 — Release Notes

Welcome to the **BeatWave v2.0.0** release! This major update introduces key UI updates, new desktop accessibility features, startup setup improvements, and a streamlined build pipeline.

---

## 🚀 Key Highlights & New Features

### 🖱️ Global Mouse Scroll Inversion
* **Scroll Wheel Direction**: Integrated a low-level input signal interceptor inside the main engine binding. For desktop users, this inverts all mouse scroll wheel inputs globally across all views (both vertical and horizontal directions) while leaving touch-screen drag gestures intact.

### 🎨 Overall Visual Redesign
* **Modernized UI Aesthetics**: Fully overhauled the interface with elegant gradients, glassmorphism layouts, frosted glass info-cards, and enhanced element contrasts for a refined visual experience.
* **Refined Layout Structure**: Repositioned app branding details, updated footer displays, and enhanced spacing variables to provide a clean and professional presentation.

### 📱 Redesigned About Screen
* **Logo Showcase**: Highlighted the new app logo directly at the top of the information card.
* **Developer Spotlight**: Added direct link navigation to your Instagram handle: **[@vortex.apps](https://instagram.com/vortex.apps)**.
* **UPI & Website Support**:
  * Added one-click navigation to your landing page: **[akshansh.vercel.app](https://akshansh.vercel.app)**.
  * Integrated a native copyable UPI option displaying **`akshanshsinha67@axl`** with a copy icon. Tapping it copies the UPI ID to your clipboard and displays a confirmation SnackBar message.
* **X (Twitter)**: Added direct integration to your X account: **[@beatlabs10](https://x.com/beatlabs10)**.
* **Cleaned Layout**: Removed the rotating flower animation and the LinkedIn social handle.

---

## 🛠️ Performance & Infrastructure

* **Private Repo Support (Setup Fix)**: Implemented a robust fallback mechanism for the plugin bootloader. If the app cannot fetch the remote `repositories.json` catalog (e.g. from private repositories or while offline), it gracefully falls back to a built-in repository catalog, eliminating the "Setup incomplete" startup block.
* **Optimized Windows CI/CD**: Simplified the GitHub Actions workflow to run on modern `windows-2022` runners using the latest stable Flutter SDK. The workflow compiles exclusively the Windows release, packages it in a ZIP archive, and uploads it directly to your build artifacts dashboard.
