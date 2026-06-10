	.syntax unified
	.section .text.GetTacticianTextConf, "ax", %progbits
@ GetTacticianTextConf @ JP 0x080444E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetTacticianTextConf
	.thumb_func
GetTacticianTextConf:
	lsls r0, r0, #0x10
	asrs r0, r0, #0xa
	ldr r1, _080444F0 @ =0x080DD41C
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080444F0: .4byte 0x080DD41C

