	.syntax unified
	.set GetCgTextFlags, 0x08090D10 + 1
	.set SetCgTextFlags, 0x08090CAC + 1
	.set sub_80913FC, 0x080913FC + 1
	.set sub_80A2C40, 0x080A2C40 + 1
	.section .text.sub_80A43E4, "ax", %progbits
@ sub_80A43E4 @ JP 0x080A43E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A43E4
	.thumb_func
sub_80A43E4:
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl sub_80A2C40
	str r0, [r4, #0x2c]
	movs r3, #1
	rsbs r3, r3, #0
	str r0, [sp]
	ldr r0, _080A4420 @ =0x06011000
	str r0, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x16
	movs r1, #0x10
	adds r2, r3, #0
	bl sub_80913FC
	bl GetCgTextFlags
	adds r1, r0, #0
	ldr r0, _080A4424 @ =0x0004000A
	orrs r0, r1
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A4420: .4byte 0x06011000
_080A4424: .4byte 0x0004000A

