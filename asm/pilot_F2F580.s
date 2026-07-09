@ Pure-0xFF ROM padding at JP 0x08F2F580..0x08F2F5C0 (64 B): the leading fill of the
@ contiguous 0xFF inter-section run that continues immediately as pad_F2F5C0. Was a
@ raw-incbin "pilot carve"; re-emitted as an explicit .fill (docs/decisions.md D27) so
@ the final-goal metric counts it as real source instead of meaningless raw incbin.
@ `.fill 0x40, 1, 0xFF` emits exactly 64 bytes of 0xFF -- byte-identical to the .bin it
@ replaces. NO .align/.balign (the only thing that could grow the ROM); make compare
@ is the byte oracle. Section name unchanged so the carved_rom fragment still places it.
	.section .pilot_F2F580, "a", %progbits
	.fill 0x40, 1, 0xFF
