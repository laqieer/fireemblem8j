	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_8021C10, "ax", %progbits
@ sub_8021C10 @ JP 0x08021C10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021C10
	.thumb_func
sub_8021C10:
	push {lr}
	ldr r0, _08021C24 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08021C24: .4byte 0x02022CA8

