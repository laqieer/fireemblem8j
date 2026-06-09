	.syntax unified
	.section .text.ekrBattle_2, "ax", %progbits
@ ekrBattle_2 @ JP 0x08051160 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ekrBattle_2
	.thumb_func
ekrBattle_2:
	ldr r2, _0805116C @ =0x02000024
	movs r1, #0
	str r1, [r2]
	ldr r1, _08051170 @ =sub_8051174
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
_0805116C: .4byte 0x02000024
_08051170: .4byte 0x08051175  @ sub_8051174

