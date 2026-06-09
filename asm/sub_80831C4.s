	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_80831C4, "ax", %progbits
@ sub_80831C4 @ JP 0x080831C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80831C4
	.thumb_func
sub_80831C4:
	push {lr}
	ldr r0, _080831D8 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080831D8: .4byte 0x02023CA8

