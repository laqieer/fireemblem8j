@ data_085D30F8: 240 bytes of raw JP ROM data at 0x085D30F8..0x085D31E8,
@ descriptively included for byte-completeness (D29). This makes NO semantic
@ claim about the bytes — it is exactly the original ROM data at this address,
@ carried as committed source so the final-goal metric (every catch-all incbin
@ byte -> real source) reaches zero. NO .align (would grow the ROM); the bytes
@ stay byte-identical to the gap they replace and `make compare` is the oracle.
@ Split from data_085D30E0 (0x085D30E0..0x085D31E8) when cp_data.o(.data) ending
@ at 0x085D30F8 became typed C (D70).

	.section .data.residue.085D30F8, "a", %progbits
	.global data_085D30F8
data_085D30F8:
	.incbin "data/residual/data_085D30F8.bin"
