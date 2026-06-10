	.section .rodata.dat_gClassData_ref, "a", %progbits
@ gClassData: region-different data, JP 0x0885b6bc..0x0885e068 (10668 B = 127 x
@ sizeof(struct ClassData)=0x54). Reassigned out of the generic data-gap blob in
@ asm/frontier_df4_banim_b.s (gap68) where it had been MISLABELED as banim
@ graphics. Sits between gCharacterData (ends 0x0885b6bc) and gItemData (starts
@ 0x0885e068), both already named. Region-different (JP nameTextId/descTextId msg
@ IDs + JP ROM pointers at +0x34..0x50) so kept as byte-perfect named incbin
@ until decompiled to literal C; the named symbol unblocks gClassData-referencing
@ funcmap functions (GetClassData/GetCharacterData inlines + their callers).
	.global gClassData
gClassData:
	.incbin "baserom.gba", 0x85B6BC, 0x29AC
