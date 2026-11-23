# r1metal

Your R1 runs r1metal: a robot you talk to, a camera, audio notes, a translator, a daily news edition, a web browser you talk to, a bell for alarms, reminders and timers, and Signal with its calls. What OpenAI does for it is paid with your own key, and COST shows every cent.

## First start

1. Choose a passphrase of 6 to 12 characters and type it again. It encrypts everything the device keeps of you, your keys, passwords, Signal and settings, your photos, videos, notes, translations, news and the conversation, and is asked at every start. Three wrong ones power the device off. Nothing recovers a lost passphrase: only a flash with --wipe starts over, and erases everything.
2. Without an OpenAI key a window asks for one. On a computer run r1 key --qr, choose SCAN QR CODE and show the code to the camera. WIFI in the same window joins a network first.
3. Join your network under SETTINGS, WIFI: pick it, type its password, and the done key joins. A network is kept once a join worked.

At the first start after an update from an earlier r1metal, type your passphrase as before: the window says ENCRYPTING while your photos, videos, notes, news and the conversation are moved under it, for as long as they are large.

## Controls

- **Wheel**: moves through lines, pictures and text, and sets what a screen sets.
- **Click**: opens or does what is shown.
- **Hold** the button a little under half a second: talks to the robot, from home and from nearly every screen. Speak while you hold, let go to send; back returns you to where you were.
- **Swipe in from the left edge**: back. **Swipe down from the top**: home.
- **Touch the robot**: on home it opens the conversation; elsewhere it does what that screen offers.
- After a minute without use the device sleeps. A press wakes it on the same screen; held, that press talks to the robot.
- Delete and forget stand last on an item's page. A stamped icon on a picture arms at the first touch and acts at the second.

## Home and looks

SETTINGS, THEMES lays everything out in one of six themes: Stage, Dial (the standard), Deck, Terminal, Companion and Rail. In Rail the wheel walks a column of icons at the left, the time and the battery under them, and what the icon it rests on opens shows beside it at once, at home too: a screen, or the list of a place like CAMERA. A click goes into the screen, or makes the list the new column of icons; back returns to the icons, and back again to the column before. Holding the button talks to the robot as anywhere, the column standing on CHAT until back returns you; beside the Pokedex it says the name, beside WEB where to go, and beside BELL what to ring for. COLORS picks one of 16 palettes for each. Every theme shows the same places: CHAT, SIGNAL, CALLS once Signal is linked, CAMERA, MIC, NEWS, WEB, BELL and SETTINGS, and POKEDEX in firmware built with the extras, which looks up a Pokemon you say or type in the language FEATURES, POKEDEX sets: English, German, French, Spanish or Italian.

## The robot

- Hold the button and speak: it answers in its voice and on screen. Touch it in the conversation to mute it; then type, and a click sends.
- At first it gets to know you; from then on it keeps a memory of what you ask it to remember and what it learns. SETTINGS, FEATURES, ROBOT, MEMORY lists the facts it keeps and DAYS the days of the conversation, each page ending in FORGET. FORGET under ROBOT clears the thread it is given every turn. Ask it to forget something and it opens that line for your click: it never forgets by itself.
- Its tools, each switched under ROBOT, TOOLS: the web search; the device, where it opens every screen and every menu of the settings, sets brightness, volume, theme, colors and the clock's offset, alarms, reminders and timers, changes settings, and has the rundowns of the news changed; your notes and translations; the news; the camera; Signal, where it reads your conversations and writes drafts you send with a click. Signal stays off until you switch it on.
- A setting it changes is set at once, whatever it costs. Only what leaves the device less safe or less private waits on its line for your click: a tool switched on, READ ALOUD on, SAID MESSAGES as text, KEEP PIN on, DRIVE on, USB MODEM on, VPN off. What is typed or scanned, the passphrase, a PIN, a password, the OpenAI key, a tunnel's config, it opens the screen for and leaves to you.
- Show it something: in the photo viewfinder touch the robot. It takes a photo for itself alone, kept nowhere, and the conversation opens with "photo attached" at its foot. What you say or type next goes with the photo; leaving the conversation drops it. With the camera tool off, touching the robot there does nothing.
- Ask it for an alarm, a reminder or a timer ("wake me at seven", "remind me of the dentist on Friday at nine", "ten minutes"), as many as you like. It says the day and time it set. BELL takes the same without the robot (see The bell).
- ROBOT also sets the model and reasoning of the conversation and of its daily recollection.

## Camera

- PHOTO: a click takes a photo; the wheel switches front and rear; touching the robot shows it a photo (see The robot). The screen then holds the photo, shows it developed and, once drawn, its pixel art; a click or a swipe back returns to the viewfinder. VIDEO: a click starts and stops a recording at 720p and 60 frames a second.
- Every saved photo is also redrawn as pixel art by OpenAI.
- PICTURES and VIDEOS: a click shows an item large or plays a video; touching the robot switches between a photo and its art. On each picture: delete and redraw (two touches), send to Signal (one touch), as it shows: its art, or the photo as taken. On each video: delete, and send to Signal, which takes a video of up to about 50 seconds; a longer one says TOO LARGE TO SEND.

## Notes and the translator

- MIC, AUDIO NOTE: RECORD, and any click stops and keeps the note. It is written down and summarized; its page has PLAY, SUMMARY, TRANSCRIPT, SEND, which sends its sound on Signal as a voice note, and DELETE.
- MIC, TRANSLATOR: TRANSLATE starts a live interpreter. Each of you speaks your own language and hears the other's in it. A click ends it; the conversation and its summary are kept.
- Over a summary or a news rundown, touch the robot to hear it read; touch again to pause.
- FEATURES, NOTES sets the model that summarizes notes and translations, and its reasoning.

## News

Every day at 08:00 the device makes an edition, asleep too: on a new device a rundown of the day's news and one of finance. NEWS lists the editions, and a day's page each rundown made that day. FEATURES, NEWS sets the hour or switches the edition off, and the model that writes the rundowns.

- FEATURES, NEWS, RUNDOWNS lists the rundowns an edition makes. Hold the button on the list and say what you want: "a rundown about Formula 1, short, in German", "switch finance off", "delete motorsport". A click on NEW, the first line, records until the next click instead. The robot takes the same request in the conversation and opens the list with it.
- For a new rundown the language model searches the web for feeds and picks an icon that fits the subject, and the device reads each feed before it keeps the rundown; a feed that gives no story is left out. The rundown is kept at once, the list standing on it, and a change to one you keep is made at once too. A deletion alone waits on the rundown's page: DELETE deletes it, KEEP keeps it as it is.
- A click on a rundown opens its page: MADE switches it on or off, each feed stands on a line, GAVE NO STORY on one that was silent when it was last read, and DELETE stands last. A feed and DELETE take two clicks on their line: the first arms it, the second removes. A rundown keeps its last feed.
- Say "mend the feeds that gave no story" and the model looks for where they are now.
- NEWS or FINANCE, once deleted, comes back from its ADD line at the foot of the list, as a new device has it.
- REQUEST MODEL and REQUEST REASONING under FEATURES, NEWS set the model that reads what you say.

## Web

- WEB is a browser of text alone. Hold the button and say where to go: a site ("the Guardian"), an address, a topic or a question. The page shows as text, each link with a number behind it.
- On a page say a link's number, or what the link is about, to open it; say "back" for the page before. The wheel scrolls.
- A click raises the keys to type instead; the done key or a click sends, and with nothing typed the keys go down.
- Touch the robot to hear the page read from where it stands on screen; touch again to pause. Holding the button to say the next request ends the reading.
- A link's number, "back" and an address the device opens itself. For anything else, and for a page it cannot read, the language model searches the web and writes the page. FEATURES, WEB sets that model and its reasoning.
- Pages are kept nowhere: they are gone when the device restarts.

## The bell

- BELL lists every alarm, reminder and timer that is set, the soonest first. A bell beside the battery shows one is set.
- Hold the button on the list and say when: "wake me at seven", "remind me of the dentist on Friday at nine", "ten minutes", or "cancel the dentist". Let go, and it is set or cancelled; the list stands on what was set. A click on NEW, the first line, records until the next click instead.
- A click on a ring's line opens it, and CANCEL, last on its page, cancels it.
- As one rings, a window says what it is for: a press silences the ring, a click lets the window go.
- FEATURES, BELL sets the model that reads what you say, and its reasoning.

## Signal

- SIGNAL shows a code: scan it on your phone under Signal, Settings, Linked devices. The R1 shows your conversations from then on.
- NEW MESSAGE lists your contacts. In a conversation hold the button to say a message: it is written down as a draft, which a click sends. Touch the robot to type instead. With SAID MESSAGES under FEATURES, SIGNAL set to voice notes, what you say goes as it was said.
- Photos and voice notes show and play; a click with no draft plays the voice note nearest the foot of the screen. Reactions stand beside their message. TEXT ONLY shows words alone.
- A photo, a video or a note you send opens SEND TO: pick the conversation, and a click sends it.
- A message that comes while the device sleeps plays the notice at the next fetch, unless its conversation is muted or SOUNDS is at 0.
- What arrives in a contact's conversation on screen is read aloud; READ ALOUD switches that off.
- Auto mode: hold a finger 3 s on the robot over a contact's conversation and the language model answers for you, each reply marked. It stops after the replies the settings allow, when you write there, or at the same gesture.
- To unlink, remove the R1 under Linked devices on the phone: everything of the account then leaves the R1.

## Calls

- CALLS, after SIGNAL once the R1 is linked, lists your calls, the newest first: who, which way, AUDIO, VIDEO or GROUP, how it went and when. NEW: stands before a call you have not seen.
- NEW CALL, the first line, lists your contacts and groups. A click on one of them, or on a call in the list, asks AUDIO or VIDEO; a click calls.
- The bar tells how the call stands: CALLING, RINGING, CONNECTING, then TALKING and its time. A click, or a swipe back, ends it; leaving its screen any other way ends it too. Touch the robot to mute your microphone, MUTED in the bar, and again to be heard.
- A VIDEO call shows your own picture upright in the bottom right corner, the whole of what the other side sees, and the other side's as large as the screen lets it beside yours: to its left when it comes upright, above it when it comes wide. The wheel switches your camera between front and rear, as in PHOTO. Your picture goes from the start of the call, and stays on until its end; where the camera fails, CAMERA FAILED stands in the bar for a second.
- A call that comes rises over whatever shows, wakes the device and rings at the level of SOUNDS: a click takes it, ANSWER standing chosen; DECLINE or a swipe back sends it away. Answering a video call sends your picture too.
- In a group's call you see who else is in it, who speaks and who is muted; in a video call, the picture of whoever spoke last. Calling a group joins its call; where you begin it in a group of fewer than 16, the group rings, RINGING until someone joins. A group's ring is answered with sound alone.
- The R1 rings only while it is connected to Signal: while SIGNAL or CALLS shows, and while it fetches. A call that reached it more than a minute late is listed as missed.
- An audio call darkens the screen after 15 seconds; a press lights it and leaves the call as it was. A call keeps the device awake.
- A call ends with ENDED, HUNG UP, DECLINED, BUSY, NOT ANSWERED after a minute, ON ANOTHER DEVICE, NOT ACCEPTED YET where the other side has yet to accept your message request, CALL IS FULL, or a word of the network's.

## Settings

A switch turns at a click. Any other setting: a click, the wheel to the value while CLICK TO SET shows, and a click to set it.

- BRIGHTNESS. VOLUME, whose second row, SOUNDS, sets the robot's searching, the bell and notices. CLOCK, set from the network, or by hand with the wheel.
- MOBILE DATA: MODEM switches the modem on, off on a new device; where WiFi is not to be had, the device then goes online over the SIM, and the line shows the modem's state. A SIM that asks for its PIN: SIM PIN, type it on the digits, and the done key hands it over. KEEP PIN, on for a new device, keeps a PIN the SIM took for every start after; off, the PIN is typed at each start and the kept one is forgotten. The APN is the network's own: nothing to set. USB MODEM, off on a new device, makes the R1 a modem for a computer on the cable: with MODEM on and the SIM online, the computer goes online over the SIM, with nothing to set up on it, and the line shows how that stands. VPN sends everything that computer sends through a WireGuard tunnel, and nothing at all while the tunnel is down; what the R1 itself sends stays outside the tunnel. TUNNEL scans the tunnel's config: SCAN QR CODE, and show the camera the config as a QR code, as qrencode -t ansiutf8 < wg0.conf draws it on a computer. FORGET in the same window takes the config away.
- PASSPHRASE changes the passphrase: type the one in use, then the new one twice, and the window says PASSPHRASE CHANGED. Nothing is encrypted anew, so it takes a moment, on the battery too.
- USB DRIVE: its one line, DRIVE, off on a new device. Switched on, a computer on the cable sees your photos, videos, notes, translations, news and the robot's conversation as a read-only drive, not encrypted; switched off, it sees a drive with nothing in it.
- COST: what OpenAI was paid, by app and by month. LIMIT, a line in it above SET OPENAI API KEY: the most a month may cost, $25 on a new device; once it is reached, new work says LIMIT REACHED.
- POWER: the battery, the time left, STANDBY, REBOOT and POWER OFF. ABOUT: what the device runs and is.

## Battery and cable

The battery stands in a corner of home, red when low. On a computer's port the R1 charges to a ceiling and holds there, the icon green; touch it to charge to full. On a cable the device does not sleep by itself. With DRIVE switched on under SETTINGS, USB DRIVE (see Settings), a computer on the cable sees it as a read-only drive. With USB MODEM switched on under SETTINGS, MOBILE DATA, a computer on the cable goes online over the SIM.

## What goes to OpenAI

What you say or type to the robot and the photos you show it; your notes and translations; the news stories; what you say to the browser; a request to it that the device cannot open itself, with the page on screen; the address of a page the device cannot read; a page you have read aloud; what you say to the bell, with the rings that are set; what you ask of the rundowns, with the rundowns kept and their feeds; photos for pixel art; Signal messages read aloud or said for a draft, and in auto mode a conversation's recent messages; with the Signal tool on, what the robot reads there. Nothing else.

## Words on the bar

- NO OPENAI KEY: none is set; SET OPENAI API KEY, last under COST, scans one.
- LIMIT REACHED: the month's limit is spent.
- NO NETWORK, NO ANSWER, REFUSED: the network or the service failed.
- NOT HEARD: too short to write down.
- NO FEED FOUND: no feed a rundown asked for gave a story.
- STORAGE FULL: nothing more can be recorded.
