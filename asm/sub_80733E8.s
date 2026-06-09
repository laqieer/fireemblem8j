	.syntax unified
	.set sub_80734BC, 0x080734BC + 1
	.section .text.sub_80733E8, "ax", %progbits
@ sub_80733E8 @ JP 0x080733E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80733E8
	.thumb_func
sub_80733E8:
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r1, #0
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	adds r2, r6, #0
	movs r3, #0x20
	bl sub_80734BC
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

