	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_8082EC4, "ax", %progbits
@ sub_8082EC4 @ JP 0x08082EC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8082EC4
	.thumb_func
sub_8082EC4:
	push {lr}
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _08082EE4 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #7
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08082EE4: .4byte 0x02023CA8

