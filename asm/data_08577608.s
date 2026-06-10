@ data_08577608: 64 bytes of raw JP ROM data at 0x08577608..0x08577648,
@ descriptively included for byte-completeness (D29). This makes NO semantic
@ claim about the bytes — it is exactly the original ROM data at this address,
@ carried as committed source so the final-goal metric (every catch-all incbin
@ byte -> real source) reaches zero. NO .align (would grow the ROM); the bytes
@ stay byte-identical to the gap they replace and `make compare` is the oracle.
@ Split off from data_085775A4 to make room for the typed sBGControlStructPtrs.

	.section .data.residue.08577608, "a", %progbits
	.global data_08577608
data_08577608:
	.incbin "baserom.gba", 0x577608, 0x40
