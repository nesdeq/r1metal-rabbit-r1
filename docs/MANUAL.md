# r1metal

Your R1 runs r1metal: a robot you talk to, a camera, audio notes, a translator, a daily news edition and Signal. What OpenAI does for it is paid with your own key, and COST shows every cent.

## First start

1. Choose a passphrase of 6 to 12 characters and type it again. It encrypts your keys, passwords, Signal and settings, and is asked at every start. Three wrong ones power the device off. Nothing recovers a lost passphrase: only a flash with --wipe starts over, and erases everything.
2. Without an OpenAI key a window asks for one. On a computer run r1 key --qr, choose SCAN QR CODE and show the code to the camera. WIFI in the same window joins a network first.
3. Join your network under SETTINGS, WIFI: pick it, type its password, and the done key joins. A network is kept once a join worked.

## Controls

- **Wheel**: moves through lines, pictures and text, and sets what a screen sets.
- **Click**: opens or does what is shown.
- **Hold** the button a little under half a second: talks to the robot, from home and from nearly every screen. Speak while you hold, let go to send; back returns you to where you were.
- **Swipe in from the left edge**: back. **Swipe down from the top**: home.
- **Touch the robot**: on home it opens the conversation; elsewhere it does what that screen offers.
- After a minute without use the device sleeps. A press wakes it on the same screen; held, that press talks to the robot.
- Delete and forget stand last on an item's page. A stamped icon on a picture arms at the first touch and acts at the second.

## Home and looks

SETTINGS, THEMES lays everything out in one of six themes: Stage, Dial (the standard), Deck, Terminal, Companion and Rail. In Rail the wheel walks a column of icons at the left, the time and the battery under them, and what the icon it rests on opens shows beside it at once, at home too: a screen, or the list of a place like CAMERA. A click goes into the screen, or makes the list the new column of icons; back returns to the icons, and back again to the column before. Holding the button talks to the robot as anywhere, the column standing on CHAT until back returns you; beside the Pokedex it says the name. COLORS picks one of 16 palettes for each. Every theme shows the same places: CHAT, SIGNAL, CAMERA, MIC, NEWS and SETTINGS, and POKEDEX in firmware built with the extras, which looks up a Pokemon you say or type in the language FEATURES, POKEDEX sets: English, German, French, Spanish or Italian.

## The robot

- Hold the button and speak: it answers in its voice and on screen. Touch it in the conversation to mute it; then type, and a click sends.
- At first it gets to know you; from then on it keeps a memory of what you ask it to remember and what it learns. SETTINGS, FEATURES, ROBOT, MEMORY lists the facts it keeps and DAYS the days of the conversation, each page ending in FORGET. FORGET under ROBOT clears the thread it is given every turn. Ask it to forget something and it opens that line for your click: it never forgets by itself.
- Its tools, each switched under ROBOT, TOOLS: the web search; the device, where it opens screens, sets brightness, volume, theme and colors, the alarm and a timer, and changes settings; your notes and translations; the news; the camera; Signal, where it reads your conversations and writes drafts you send with a click. Signal stays off until you switch it on.
- A change of a setting that leaves the device as safe, as cheap and as private is made at once; any other waits on its line for your click.
- Show it something: in the photo viewfinder touch the robot. It takes a photo for itself alone, kept nowhere, and the conversation opens with "photo attached" at its foot. What you say or type next goes with the photo; leaving the conversation drops it. With the camera tool off, touching the robot there does nothing.
- Ask it for an alarm or a timer ("wake me at seven", "ten minutes"). A bell beside the battery shows one is set; a press silences the ring.
- ROBOT also sets the model and reasoning of the conversation and of its daily recollection.

## Camera

- PHOTO: a click takes a photo; the wheel switches front and rear; touching the robot shows it a photo (see The robot). The screen then holds the photo, shows it developed and, once drawn, its pixel art; a click or a swipe back returns to the viewfinder. VIDEO: a click starts and stops a recording at 720p and 60 frames a second.
- Every saved photo is also redrawn as pixel art by OpenAI.
- PICTURES and VIDEOS: a click shows an item large or plays a video; touching the robot switches between a photo and its art. On each picture: delete and redraw (two touches), send to Signal (one touch), as it shows: its art, or the photo as taken.

## Notes and the translator

- MIC, AUDIO NOTE: RECORD, and any click stops and keeps the note. It is written down and summarized; its page has PLAY, SUMMARY, TRANSCRIPT and DELETE.
- MIC, TRANSLATOR: TRANSLATE starts a live interpreter. Each of you speaks your own language and hears the other's in it. A click ends it; the conversation and its summary are kept.
- Over a summary or a news rundown, touch the robot to hear it read; touch again to pause.
- FEATURES, NOTES sets the model that summarizes notes and translations, and its reasoning.

## News

Every day at 08:00 the device makes an edition of the day's news and finance, asleep too. NEWS lists the editions. FEATURES, NEWS sets the hour or switches the edition off, which rundowns it makes, and their model.

## Signal

- SIGNAL shows a code: scan it on your phone under Signal, Settings, Linked devices. The R1 shows your conversations from then on.
- NEW MESSAGE lists your contacts. In a conversation hold the button to say a message: it is written down as a draft, which a click sends. Touch the robot to type instead. With SAID MESSAGES under FEATURES, SIGNAL set to voice notes, what you say goes as it was said.
- Photos and voice notes show and play; a click with no draft plays the voice note nearest the foot of the screen. TEXT ONLY shows words alone.
- What arrives in a contact's conversation on screen is read aloud; READ ALOUD switches that off.
- Auto mode: hold a finger 3 s on the robot over a contact's conversation and the language model answers for you, each reply marked. It stops after the replies the settings allow, when you write there, or at the same gesture.
- To unlink, remove the R1 under Linked devices on the phone: everything of the account then leaves the R1.

## Settings

A switch turns at a click. Any other setting: a click, the wheel to the value while CLICK TO SET shows, and a click to set it.

- BRIGHTNESS. VOLUME, whose second row, SOUNDS, sets the robot's searching, the bell and notices. CLOCK, set from the network, or by hand with the wheel.
- PASSPHRASE changes the passphrase.
- COST: what OpenAI was paid, by app and by month. LIMIT, a line in it above SET OPENAI API KEY: the most a month may cost, $25 on a new device; once it is reached, new work says LIMIT REACHED.
- POWER: the battery, the time left, STANDBY, REBOOT and POWER OFF. ABOUT: what the device runs and is.

## Battery and cable

The battery stands in a corner of home, red when low. On a computer's port the R1 charges to a ceiling and holds there, the icon green; touch it to charge to full. On a cable the device does not sleep by itself, and it is a read-only USB drive with your photos, videos, notes, translations, news and the robot's conversation.

## What goes to OpenAI

What you say or type to the robot and the photos you show it; your notes and translations; the news stories; photos for pixel art; Signal messages read aloud or said for a draft, and in auto mode a conversation's recent messages; with the Signal tool on, what the robot reads there. Nothing else.

## Words on the bar

- NO OPENAI KEY: none is set; SET OPENAI API KEY, last under COST, scans one.
- LIMIT REACHED: the month's limit is spent.
- NO NETWORK, NO ANSWER, REFUSED: the network or the service failed.
- NOT HEARD: too short to write down.
- STORAGE FULL: nothing more can be recorded.
