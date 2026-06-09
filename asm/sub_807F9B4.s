	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_807F9B4, "ax", %progbits
@ sub_807F9B4 @ JP 0x0807F9B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807F9B4
	.thumb_func
sub_807F9B4:
	push {lr}
	ldr r0, _0807F9C8 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807F9C8: .4byte 0x02023CA8

