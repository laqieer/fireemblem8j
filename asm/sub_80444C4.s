	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_80AB354, 0x080AB354 + 1
	.section .text.sub_80444C4, "ax", %progbits
@ sub_80444C4 @ JP 0x080444C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80444C4
	.thumb_func
sub_80444C4:
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [r0, #0x40]
	movs r0, #1
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	mov r2, sp
	bl sub_80AB354
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

