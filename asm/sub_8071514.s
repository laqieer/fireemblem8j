	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8071568, 0x08071568 + 1
	.set sub_8071608, 0x08071608 + 1
	.set sub_807167C, 0x0807167C + 1
	.set sub_8071734, 0x08071734 + 1
	.section .text.sub_8071514, "ax", %progbits
@ sub_8071514 @ JP 0x08071514 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071514
	.thumb_func
sub_8071514:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8071734
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8071568
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8071608
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r4, #0x5c]
	str r4, [sp]
	movs r1, #1
	movs r2, #0xc
	movs r3, #0
	bl sub_807167C
	ldr r0, [r4, #0x5c]
	str r4, [sp]
	movs r1, #0x23
	movs r2, #0x19
	movs r3, #1
	bl sub_807167C
	adds r0, r4, #0
	bl sub_8002DE4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

