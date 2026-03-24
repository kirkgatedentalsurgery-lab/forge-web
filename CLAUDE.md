# CLAUDE.md

## Project
ADAPTIS — Train. Adapt. Become.

## Mission
Build a premium, mobile-first intelligent lifting coach that combines the best of RP Strength, Fitbod, Hevy, Jefit, and StrengthLog. ADAPTIS should feel like an elite coach with a beautiful logger: smart enough for advanced lifters, simple enough for busy professionals, fast enough to use between sets.

## Non-Negotiables
1. This is a serious lifting app, not a generic wellness app.
2. Training logic must be opinionated and evidence-aligned.
3. Logging must be frictionless — a set in under 2 seconds.
4. Support both hypertrophy and strength.
5. Workout generation must consider equipment, time, recovery, and goal.
6. The UI must feel premium, minimal, and fast.
7. Every architectural choice should favor maintainability.

## Core Product Principles
- Coach, not spreadsheet
- Adaptive, not random
- Fast, not cluttered
- Deep, not confusing
- Serious, not gimmicky

---

## Tech Stack
- **Framework:** Next.js 15 (App Router)
- **Language:** TypeScript (strict mode)
- **Database:** PostgreSQL via Supabase
- **Auth:** Supabase Auth
- **Styling:** Tailwind CSS v4 + shadcn/ui
- **State:** Zustand (client state), TanStack Query (server state)
- **Charts:** Recharts
- **Validation:** Zod
- **Testing:** Vitest
- **Deployment:** Vercel
- **PWA:** next-pwa for mobile install

## File Structure
```
src/
  app/              # Next.js App Router pages and layouts
    (app)/          # Authenticated app routes (dashboard, workout, programs, etc.)
    (auth)/         # Login and register pages
    (onboarding)/   # Onboarding wizard
  components/       # Shared UI components
    layout/         # Shell, nav, sidebar
    programs/       # Program-specific components
    ui/             # shadcn/ui primitives (button, card, input, etc.)
    workout/        # Workout logging components
  engines/          # Training logic (pure functions, no DB calls)
    __tests__/      # Vitest test files for all engines
  hooks/            # React hooks (useAuth, useUserProfile, etc.)
  lib/              # Utilities (supabase client, constants, utils)
  providers/        # React context providers (auth, theme, query)
  stores/           # Zustand stores
  types/            # TypeScript type definitions
supabase/
  migrations/       # SQL migration files (numbered 001–016+)
```

## Supabase
- **Project URL:** https://mvhkjrfqiqnsqmvfzfzi.supabase.co
- All migrations run via SQL Editor (no CLI migration tool)
- Copy SQL to clipboard with `pbcopy`, user pastes in Supabase SQL Editor
- RLS is enabled — queries from the client run as the authenticated user
- Exercise data is seeded via migrations (not runtime inserts)
- When writing migrations, always use `IF NOT EXISTS` / `ON CONFLICT` where possible

## Running the App
```bash
cd ~/forge-web && npm run dev    # http://localhost:3000
npx vitest run                    # Run all tests
```

## Live Deployment
- **URL:** https://forge-web-alpha.vercel.app
- Auto-deploys on push to `main` branch
- Environment variables set in Vercel dashboard

---

## Brand Identity

### Name and Tagline
- **Name:** ADAPTIS (always uppercase in display)
- **Tagline:** Train. Adapt. Become.

### Logo
- Located at: `/Users/jonathanlane/Downloads/ChatGPT Image Mar 22, 2026, 10_51_07 AM.png`
- Features a stylized "A" with a blue gradient swoosh
- Dark background (#0a0f1a to #141b2d)

### Color System
The ADAPTIS palette is built from the logo's blue gradient. All colors use oklch for perceptual uniformity.

**Primary blue gradient (from the logo "A"):**
- Light blue: `#7EC8E3` / `oklch(0.80 0.08 220)`
- Mid blue: `#4A9FD9` / `oklch(0.65 0.12 240)`
- Deep blue: `#2E6FBB` / `oklch(0.50 0.14 250)` — this is `--primary`
- Navy: `#1a3a5c` / `oklch(0.30 0.06 250)`

**Dark mode (default):**
- Background: `oklch(0.12 0.01 250)` — near-black with blue undertone
- Card: `oklch(0.16 0.01 250)` — slightly elevated
- Border: `oklch(0.25 0.01 250)` — subtle separation
- Foreground: `oklch(0.95 0.01 250)` — off-white

**Light mode:**
- Background: `oklch(0.98 0.005 250)`
- Card: white
- Primary: `oklch(0.50 0.14 250)`

**Semantic colors:**
- Success/PR: green (`oklch(0.65 0.15 145)`)
- Warning/fatigue: amber (`oklch(0.70 0.15 75)`)
- Destructive/pain: red (`oklch(0.55 0.2 25)`)

### Typography
- Headings: Inter or system-ui, tight tracking (`tracking-tight`), bold/semibold
- Body: system-ui, generous line-height (1.6–1.7)
- Data/numbers: tabular-nums for aligned columns in workout logging
- All caps for: brand name "ADAPTIS", tab labels, section headers where appropriate

### Design Guardrails
- **Never** use default Tailwind palette colors (indigo-500, blue-600). Always use the ADAPTIS CSS variables.
- **Shadows:** Layered, color-tinted with low opacity. Not flat `shadow-md`.
- **Gradients:** Use the brand blue gradient for hero elements and CTAs. Layer with subtle noise for depth.
- **Animations:** Only animate `transform` and `opacity`. Use `transition-transform duration-150` not `transition-all`. Spring-style easing preferred.
- **Interactive states:** Every clickable element must have hover, focus-visible, and active states. No exceptions.
- **Touch targets:** Minimum 44x44px on all tappable elements (Apple HIG).
- **Spacing:** Use consistent spacing tokens. Don't mix random Tailwind steps.
- **Depth system:** Three layers — base (background), elevated (card), floating (modal/sheet). Each layer is visually distinct.
- **Empty states:** Every list/page must have a meaningful empty state, not just blank space.

---

## Training Engine

### Training Modes
- **Coach Mode:** App decides split, exercises, and progression automatically.
- **Builder Mode:** User picks split, chooses exercises from filtered list, app handles progression.
- Guided and Manual modes removed for simplicity.

### Split Logic
- 2 days: full body or upper/lower
- 3 days: full body or PPL-lite
- 4 days: upper/lower or torso-limbs
- 5 days: PPL + upper/lower or specialization
- 6 days: PPL repeated or advanced specialization
- Custom: user defines each day's muscle group focus

### Session Duration Presets
These define how many exercises per session:
- **30 min:** 3–4 exercises
- **45 min:** 4–5 exercises
- **60 min:** 5–7 exercises
- **75 min:** 6–8 exercises
- **90+ min:** 7–10 exercises

The program generator MUST respect these counts. If the UI promises "5–7 exercises", the generated workout must have 5–7 exercises.

### Exercise Ordering
1. Primary compound
2. Secondary compound
3. Accessories
4. Isolation
5. Optional pump / finisher

### Hypertrophy Logic
- Weekly set targets by muscle group (beginner: 6–10, intermediate: 8–14, advanced: 10–20)
- Priority muscles: +20% to +40% volume
- RIR targets per week (starts ~3–4 RIR, progresses to 0–1 by end of block)
- Gradual volume progression across block
- Deload week after fatigue build-up

### Strength Logic
- Main lift specificity (squat, bench, deadlift, OHP)
- Percentage-based loading with training max (90% of 1RM)
- 4 phases: accumulation, intensification, deload, peaking
- e1RM tracking

### Progressive Overload
- After each session, suggest weight/rep increases based on performance
- Auto-load previous session's weight and reps into next set
- If all sets completed at target reps: increase weight
- If performance declining: maintain or reduce

### Readiness Engine
Readiness score (0–100) from: sleep quality, sleep duration, energy, stress, soreness, motivation.
- 85–100: push day (increase volume/intensity slightly)
- 70–84: normal plan
- 55–69: conservative (reduce volume slightly)
- Below 55: recovery-biased (reduce significantly)

### Deload Triggers
Trigger when 3+ present: 2 poor sessions in a row, persistent high soreness, low readiness repeatedly, declining performance, increasing pain flags, reduced motivation.

---

## Workout Logging UX
The workout screen is where users spend 90% of their time. It must be:
- **All exercises visible** — show every exercise in the session, not one at a time
- **Any-order logging** — user can log sets on any exercise in any order
- **Reorderable** — exercises can be moved up/down mid-workout
- **Auto-fill** — previous set's weight/reps pre-populate the next set
- **One-tap matching** — tap to match last session's weight/reps instantly
- **PR detection** — celebrate new personal records with animation
- **Rest timer** — continuous timer with audible beep + vibration at zero
- **Pain flags** — toggle per-set with location and severity
- **Exercise swap** — swap any exercise mid-workout from substitution engine
- **Warm-up generator** — auto-generate warm-up sets based on working weight

### Program Advancement
When a workout is completed (all sets logged + feedback submitted), the program MUST advance to the next day automatically. The user should never be stuck on a completed workout.

---

## Analytics
Dashboard must include:
- Weekly training volume by muscle group (bar chart)
- e1RM trends (line chart per exercise)
- Readiness trend (area chart)
- Personal records board
- Muscle balance radar chart
- Coach notes (plain-English summaries)
- Body weight trend
- Adherence rate

---

## Coding Rules
- Use strict TypeScript. No `any` unless absolutely necessary.
- Validate all user inputs with Zod schemas.
- Keep business logic in `engines/` as pure functions. No DB calls in engine files.
- Keep UI components focused on rendering. Business logic lives in hooks or engines.
- Prefer explicit naming over clever abstractions.
- Avoid giant files — split at ~200 lines.
- Add comments only where they truly help.
- Don't over-engineer. Only build what's needed now.

## Testing
All engines must have tests. Currently 91 tests across:
- `readiness-engine.test.ts` (15 tests)
- `progressive-overload.test.ts` (15 tests)
- `deload-detector.test.ts` (14 tests)
- `strength-mode.test.ts` (14 tests)
- `split-templates.test.ts` (12 tests)

Run with `npx vitest run`. All must pass before pushing.

## Error Handling
- Wrap all Supabase calls in try-catch
- Show user-facing error messages (not raw errors)
- Log errors to console with context
- Never fail silently — if something breaks, the user must know

## Performance
- Batch Supabase queries where possible (program detail: 3 queries not 25)
- Use `select()` to only fetch needed columns
- Lazy load heavy components (Recharts, exercise picker)
- Minimize re-renders with proper React memo/callback patterns

## Accessibility
- Minimum 44x44px touch targets
- Proper focus management on modals and sheets
- Semantic HTML (buttons for actions, links for navigation)
- Color contrast ratio 4.5:1 minimum for text
- Keyboard navigation support on web

## Mobile / PWA
- Mobile-first responsive design
- Safe area insets for notched devices (`pb-safe`)
- Numeric keyboard (`inputMode="decimal"`) for weight/rep inputs
- Press animation on interactive elements (`active:scale-95`)
- Hide scrollbars on horizontal scroll areas
- PWA manifest for "Add to Home Screen"

---

## Current State (as of March 2026)
- 766 exercises in database with muscle group mappings
- 91 passing tests
- Auth, onboarding, dashboard, programs, workout logging, analytics, settings all built
- Coach Mode and Builder Mode active
- Custom split designer built
- Readiness check-in, deload detection, progressive overload all wired up
- Deployed at forge-web-alpha.vercel.app

## Known Issues Being Fixed
- Exercise muscle mappings from wger import need correction (migration 016 in progress)
- Program advancement after workout completion needs verification
- Rest timer pauses when screen locks (browser limitation)

## Future Roadmap
- Nutrition integration
- Apple Health / wearable integration
- Coach portal
- AI coach chat
- Video form review
- Social / community features
- Stripe payments for monetization
- Native iOS/Android app (React Native or Swift)

## Final Note
When there is a product tradeoff, always choose the path that makes ADAPTIS feel like a serious lifting product for people who actually train. Never make it feel generic, gimmicky, or like a template.
