	.section .rodata.dat_ending_staffreel_p1, "a", %progbits
@ src/data/ending/ending_staffreel.o: region-same content at JP 0x08accd98 (US 0x08a46988, shift -0xFFF79BF0); incbin baserom.gba
	.global Img_StaffReelEnt_8
Img_StaffReelEnt_8:
	.incbin "baserom.gba", 0xACCD98, 0x928
	.global Img_StaffReelEnt_9
Img_StaffReelEnt_9:
	.incbin "baserom.gba", 0xACD6C0, 0x1494
