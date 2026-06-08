	.section .rodata.dat_EventScr_FloorClearInTower_ref, "a", %progbits
@ EventScr_FloorClearInTower: region-different data, JP 0x08a60a58 read from funcmap-aligned code literal (US 0x089ee920); incbin baserom.gba
	.global EventScr_FloorClearInTower
EventScr_FloorClearInTower:
	.incbin "baserom.gba", 0xA60A58, 0x5C
