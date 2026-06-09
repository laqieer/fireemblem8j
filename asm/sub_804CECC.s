	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_804CECC, "ax", %progbits
@ sub_804CECC @ JP 0x0804CECC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804CECC
	.thumb_func
sub_804CECC:
	push {lr}
	ldr r0, _0804CEE4 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	pop {r0}
	bx r0
	.align 2, 0
_0804CEE4: .4byte 0x02023CA8

