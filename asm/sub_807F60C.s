	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_807F60C, "ax", %progbits
@ sub_807F60C @ JP 0x0807F60C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807F60C
	.thumb_func
sub_807F60C:
	push {lr}
	ldr r0, _0807F620 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0807F620: .4byte 0x02023CA8

