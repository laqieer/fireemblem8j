	.syntax unified
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.section .text.sub_804E110, "ax", %progbits
@ sub_804E110 @ JP 0x0804E110 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804E110
	.thumb_func
sub_804E110:
	push {r4, lr}
	ldr r1, _0804E164 @ =0x0202BCEC
	ldr r0, _0804E168 @ =0x03001858
	ldr r0, [r0]
	strb r0, [r1, #0xf]
	ldr r4, _0804E16C @ =0x03003020
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
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E164: .4byte 0x0202BCEC
_0804E168: .4byte 0x03001858
_0804E16C: .4byte 0x03003020

