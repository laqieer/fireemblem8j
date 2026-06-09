	.section .rodata.dat_EventScr_GiveTreasureToLuckyDog_ref, "a", %progbits
@ EventScr_GiveTreasureToLuckyDog: region-different data, JP 0x08a60754 read from funcmap-aligned code literal (US 0x089ee61c); incbin baserom.gba
	.global EventScr_GiveTreasureToLuckyDog
EventScr_GiveTreasureToLuckyDog:
	.incbin "baserom.gba", 0xA60754, 0x60
