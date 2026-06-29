# Per-song mid2agb flags (ported from ../fireemblem8u/songs.mk).
# Each rule rebuilds the descriptive song .s from the committed .mid with the
# exact FE8 build flags (-E -G<voicegroup> -R020 -P010 -V<volume>); the resulting
# m4a bytecode is byte-identical to the JP ROM song body once linked at the JP
# song address with the voicegroup symbol bound to its JP address (see docs/sound.md).
# D311: only the songs converted to the editable .mid form so far are listed here.

MID_SUBDIR := sound/songs/midi

$(MID_SUBDIR)/song001_agbfe3_bgm_opening.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G000 -R020 -P010 -V051

$(MID_SUBDIR)/song002_agbfe3_bgm_op_theme_i.s: %.s: %.mid
	$(MID2AGB) $< $@ -E -G001 -R020 -P010 -V050
