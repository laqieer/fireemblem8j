	.syntax unified
	.set sub_804987C, 0x0804987C + 1
	.set sub_8049EF4, 0x08049EF4 + 1
	.section .text.sub_804A070, "ax", %progbits
@ sub_804A070 @ JP 0x0804A070 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A070
	.thumb_func
sub_804A070:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_804987C
	ldr r2, _0804A090 @ =0x080DEF7C
	str r4, [sp]
	movs r0, #0x58
	movs r1, #0x3c
	movs r3, #0
	bl sub_8049EF4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A090: .4byte 0x080DEF7C

