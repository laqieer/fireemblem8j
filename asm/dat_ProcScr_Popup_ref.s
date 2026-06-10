	.section .rodata.dat_ProcScr_Popup_ref, "a", %progbits
@ ProcScr_Popup: region-different data, JP 0x085b9fac; incbin baserom.gba
@ regenerated from layout/carved_rom.tsv (CI consistency: e5499b2 deleted the .s but kept the row)
	.global ProcScr_Popup
ProcScr_Popup:
	.incbin "data/residual/ProcScr_Popup.bin"
