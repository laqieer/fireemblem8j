	.syntax unified
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_8035E9C, "ax", %progbits
@ sub_8035E9C @ JP 0x08035E9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035E9C
	.thumb_func
sub_8035E9C:
	push {r4, lr}
	bl sub_804F610
	ldr r4, _08035ED8 @ =0x03003020
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	bl SetDefaultColorEffects
	adds r2, r4, #0
	adds r2, #0x36
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	adds r4, #0x37
	ldrb r0, [r4]
	orrs r0, r1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035ED8: .4byte 0x03003020

