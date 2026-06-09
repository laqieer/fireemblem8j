	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_80148C8, "ax", %progbits
@ sub_80148C8 @ JP 0x080148C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80148C8
	.thumb_func
sub_80148C8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	subs r0, #1
	str r0, [r4, #0x34]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _080148E8
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	bl sub_80D65C0
	adds r0, r4, #0
	bl sub_8002DE4
_080148E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

