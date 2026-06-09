	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CA318, 0x080CA318 + 1
	.section .text.sub_80CAE84, "ax", %progbits
@ sub_80CAE84 @ JP 0x080CAE84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CAE84
	.thumb_func
sub_80CAE84:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r2, #0x80
	lsls r2, r2, #1
	ldrh r3, [r4, #0x2a]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x20
	bl sub_8012E84
	bl sub_80CA318
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080CAEB2
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CAEB6
_080CAEB2:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CAEB6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

