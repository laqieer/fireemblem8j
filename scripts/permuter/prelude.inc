/* asm prelude prepended to the target .s by decomp-permuter's import.py.
   FE8J is ARM/Thumb (agbcc, -mthumb-interwork); the target .s starts with
   `glabel <func>`. */

.macro glabel label
	.global \label
	.type \label, %function
	.thumb_func
	\label:
.endm

.text
.thumb
