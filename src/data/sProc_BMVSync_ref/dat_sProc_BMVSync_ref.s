/* De-pointered from data/residual/sProc_BMVSync.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */
	.section .rodata.dat_sProc_BMVSync_ref, "a", %progbits
	.global sProc_BMVSync
sProc_BMVSync:
	.4byte 0x0001000F
	.4byte 0x00000000
	.4byte 0x00000004
	.4byte BMapVSync_OnEnd + 0x1
	.4byte 0x0000000E
	.4byte 0x00000000
	.4byte 0x0000000B
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte ExecNightmareStaffEffect + 0xD
	.4byte 0x00000002
	.4byte ExecNightmareStaffEffect + 0x55
	.4byte 0x00000002
	.4byte SyncUnitSpriteSheet + 0x1
	.4byte 0x00000002
	.4byte WfxVSync + 0x1
	.4byte 0x00000003
	.4byte BMapVSync_OnLoop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
