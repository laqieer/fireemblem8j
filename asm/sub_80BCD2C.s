	.syntax unified
	.set sub_80138B8, 0x080138B8 + 1
	.section .text.sub_80BCD2C, "ax", %progbits
@ sub_80BCD2C @ JP 0x080BCD2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BCD2C
	.thumb_func
sub_80BCD2C:
	push {r4, lr}
	sub sp, #0x14
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r4, [r0, #0x58]
	adds r4, #0x10
	movs r1, #1
	lsls r1, r4
	str r1, [sp, #8]
	movs r1, #0x10
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_80138B8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0

