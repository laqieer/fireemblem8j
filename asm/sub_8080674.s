	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_8080674, "ax", %progbits
@ sub_8080674 @ JP 0x08080674 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080674
	.thumb_func
sub_8080674:
	push {lr}
	ldr r0, _08080688 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08080688: .4byte 0x02023CA8

