	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_801D730, 0x0801D730 + 1
	.set sub_8037474, 0x08037474 + 1
	.section .text.sub_8022ED8, "ax", %progbits
@ sub_8022ED8 @ JP 0x08022ED8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022ED8
	.thumb_func
sub_8022ED8:
	push {lr}
	ldr r0, _08022EF8 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	bl sub_801D730
	bl sub_8037474
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08022EF8: .4byte 0x02023CA8

