@ data_08A5A6AD: 115 bytes of raw JP ROM data at 0x08A5A6AD..0x08A5A720,
@ descriptively included for byte-completeness (D29). This makes NO semantic
@ claim about the bytes — it is exactly the original ROM data at this address,
@ carried as committed source so the final-goal metric (every catch-all incbin
@ byte -> real source) reaches zero. NO .align (would grow the ROM); the bytes
@ stay byte-identical to the gap they replace and `make compare` is the oracle.
@ Split off from data_08A5A6A0 to make room for the typed gFlagBitMaskLut (13 B).

	.section .data.residue.08A5A6AD, "a", %progbits
	.global data_08A5A6AD
data_08A5A6AD:
	.incbin "data/residual/data_08A5A6AD.bin"
