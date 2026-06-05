@ Symbols for functions/data that still live inside the raw-ROM baseline but are
@ called from decompiled code. Declared as typed Thumb functions so the linker
@ emits a direct Thumb BL (no interworking veneer) to their JP address.
@
@ Addresses come from scripts/match_us_jp.py (see layout/us_jp_funcmap.tsv).
@ Entries are removed as the corresponding code is carved out into real source.

	.thumb

	.global memcpy
	.type   memcpy, %function
	.thumb_func
	.set    memcpy, 0x080D6908 + 1

	.global __modsi3
	.type   __modsi3, %function
	.thumb_func
	.set    __modsi3, 0x080D6690 + 1
