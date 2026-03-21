# CLAUDE.md

## Project
Forge — Intelligent Lifting Coach

## Mission
Build a premium, mobile-first lifting app that combines the best parts of RP Strength, Fitbod, Hevy, Jefit, and StrengthLog.

Forge should feel like an elite coach with a beautiful logger:
- smart enough for advanced lifters
- simple enough for busy professionals
- fast enough to use between sets

## Non-negotiables
1. This is not a generic wellness app.
2. Training logic must be opinionated and evidence-aligned.
3. Logging must be frictionless.
4. The app must support both hypertrophy and strength.
5. Workout generation must consider equipment, time, recovery, and goal.
6. The UI should feel premium, minimal, and fast.
7. Every architectural choice should favor maintainability.

## Core product principles
- Coach, not spreadsheet
- Adaptive, not random
- Fast, not cluttered
- Deep, not confusing
- Serious, not gimmicky

## Product pillars
### 1. Smart programming
Forge must generate structured training blocks and day-by-day sessions.

### 2. Autoregulation
Forge must adapt training using:
- RIR/RPE
- performance trends
- soreness
- readiness
- pain flags
- adherence

### 3. Elite logging UX
Users must be able to log a set in under 2 seconds.

### 4. Useful analytics
Analytics must help users make better decisions, not just admire charts.

## Inspiration map
### RP Strength
Take:
- mesocycles
- volume landmarks mindset
- RIR-driven progression
- fatigue and soreness feedback
- deload logic
- muscle prioritisation

Avoid:
- excessive jargon in the UI
- making casual users feel lost

### Fitbod
Take:
- equipment-aware generation
- recovery-aware planning
- travel and home gym flexibility
- “open app and train” simplicity

Avoid:
- random feeling workouts
- weak long-term structure

### Hevy / Strong
Take:
- clean logging
- fast inputs
- timer and PR visibility
- beautiful history

### Jefit
Take:
- analytics depth
- training volume views
- progression history

### StrengthLog / barbell apps
Take:
- e1RM tracking
- percentage-based progression
- lift specificity

## Main user types
### 1. Busy serious lifter
- trains 3–5 days/week
- wants excellent programming
- has limited time
- wants to open app and go

### 2. Intermediate hypertrophy lifter
- wants more muscle
- wants better progression
- likes data but not excessive complexity

### 3. Strength / powerbuilding lifter
- cares about squat, bench, deadlift, overhead press
- wants structure and analytics

### 4. Travel / flexible equipment user
- needs the plan to adapt to whatever gym is available

## MVP scope
Build these first:
1. onboarding
2. exercise database
3. user profile and equipment profile
4. workout generator
5. training blocks and mesocycles
6. workout logging UI
7. recovery check-ins
8. progression engine
9. basic analytics dashboard
10. substitutions engine

## User onboarding requirements
Collect:
- goal
- experience level
- training age
- days per week
- session duration
- equipment available
- preferred split or no preference
- favorite exercises
- disliked exercises
- injury / limitation flags
- priority muscles
- current body weight optional
- current estimated lifts optional

At end of onboarding, create:
- user profile
- equipment profile
- first training block
- week 1 workouts

## Goals to support
- hypertrophy
- strength
- powerbuilding
- general fitness
- fat loss with muscle retention

## Training modes
### Coach Mode
App decides split, exercises, and progression.

### Guided Mode
App creates plan, user can swap from approved substitutes.

### Builder Mode
User picks split and structure, app handles progression.

### Manual Mode
User logs training manually and still receives analytics.

## Training engine rules
### Split logic
- 2 days: full body or upper/lower
- 3 days: full body or PPL-lite
- 4 days: upper/lower or torso-limbs
- 5 days: PPL + upper/lower or specialization
- 6 days: PPL repeated or advanced specialization

### Exercise ordering
General order:
1. primary compound
2. secondary compound
3. accessories
4. isolation
5. optional pump / finisher work

### Exercise metadata required
Each exercise must define:
- primary muscles
- secondary muscles
- movement pattern
- equipment
- fatigue score
- joint stress score
- spine load score
- skill score
- hypertrophy score
- strength score
- unilateral or bilateral
- stable or unstable
- substitute candidates

### Session generation constraints
Workout generator must consider:
- available equipment
- session length
- recent fatigue
- muscle readiness
- user goal
- current mesocycle week
- exercise variety rules
- favorite / disliked exercises

## Hypertrophy logic
Implement:
- weekly set targets by muscle group
- priority muscle multiplier
- RIR targets per week
- gradual volume progression across block
- deload week after fatigue build-up

Suggested starting weekly hard sets:
- beginner: 6–10 per muscle
- intermediate: 8–14
- advanced: 10–20

Priority muscles:
- +20% to +40% volume

Low-priority muscles:
- maintenance volume

### Hypertrophy progression
- if performance good and fatigue low → increase load or sets
- if performance good and fatigue moderate → hold volume, increase load selectively
- if performance poor and fatigue high → reduce sets or deload
- if pain flagged → substitute movement pattern

## Strength logic
Implement:
- main lift specificity
- accessory support work
- e1RM tracking
- RIR and/or percentage-based loading
- accumulation → intensification → deload structure

Main lifts to support first:
- squat
- bench press
- deadlift
- overhead press
- weighted pull-up optional

## Readiness engine
Track readiness from:
- sleep quality
- sleep duration
- energy
- stress
- soreness
- motivation
- recent performance

Use readiness bands:
- 85–100: push day
- 70–84: normal plan
- 55–69: conservative plan
- below 55: recovery-biased version

Readiness should adjust:
- target load slightly
- total sets slightly
- exercise choice when appropriate

## Recovery tracking
Track at 3 levels:
### Global
- sleep
- stress
- energy
- motivation
- global soreness

### Local muscle
- chest
- back
- quads
- hamstrings
- glutes
- delts
- biceps
- triceps
- calves
- abs

### Pattern-specific
- squat pattern
- hinge pattern
- horizontal press
- vertical press
- horizontal pull
- vertical pull

## Deload triggers
Trigger deload when 3 or more are present:
- 2 poor sessions in a row
- soreness persistently high
- readiness score low repeatedly
- reps/load trending down at same RIR
- pain flags increasing
- motivation reduced

Deload behavior:
- reduce volume 40%–60%
- slightly reduce intensity
- keep movement patterns familiar

## Logging UX requirements
Today’s workout page must show:
- exercise name
- previous best
- target sets/reps/RIR/load
- quick set logging controls
- timer
- notes
- pain toggle
- swap exercise
- add exercise
- skip exercise

Set logging must be possible with minimal taps.

## Analytics requirements
Dashboard should include:
- weekly training volume by muscle group
- e1RM trends
- personal records
- readiness trend
- adherence rate
- fatigue warnings
- body weight trend
- muscle balance overview

Also include plain-English summaries like:
- “Chest volume is progressing well.”
- “Quad fatigue is accumulating.”
- “A deload is likely needed within the next 5–7 days.”

## Design system
Style goals:
- dark mode first
- premium and sharp
- minimal clutter
- bold typography
- excellent spacing
- large touch targets
- mobile-first

Primary screens:
- dashboard
- today’s workout
- exercise details
- history
- analytics
- profile/settings

## Tech stack
Use:
- Next.js 14+
- TypeScript
- PostgreSQL
- Prisma
- Supabase Auth
- Tailwind CSS
- shadcn/ui
- Zustand
- TanStack Query
- Recharts for analytics
- Zod for validation

## File structure expectations
Use clean domain separation:
- app routes in `src/app`
- shared UI in `src/components`
- training engine in `src/lib/training`
- analytics logic in `src/lib/analytics`
- DB code in `src/lib/db`
- types in `src/types`
- seed data in `src/data`

## Coding rules
- Use strict TypeScript.
- Use server actions or route handlers cleanly.
- Validate all API inputs with Zod.
- Keep business logic out of UI components.
- Build composable utilities.
- Prefer explicit naming over clever abstractions.
- Add comments only where they truly help.
- Avoid giant files.

## Testing priorities
Must test:
- readiness scoring
- workout generation
- progression rules
- deload triggers
- substitution logic
- analytics aggregation

## Future roadmap after MVP
- nutrition integration
- Apple Health / wearable integration
- coach portal
- AI coach chat
- video form review
- social / community optional

## Deliverables expected
1. production-quality scaffold
2. Prisma schema
3. seed script with exercise examples
4. training engine utilities
5. readiness scoring utility
6. dashboard starter UI
7. workout logger starter UI
8. analytics starter UI
9. README
10. setup instructions

## Final note
Whenever there is a product tradeoff, choose the path that makes Forge feel like a serious lifting product for people who actually train.
