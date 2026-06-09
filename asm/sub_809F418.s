	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_809C5EC, 0x0809C5EC + 1
	.section .text.sub_809F418, "ax", %progbits
@ sub_809F418 @ JP 0x0809F418 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809F418
	.thumb_func
sub_809F418:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	ldr r2, [r5, #0x3c]
	ldr r3, [r5, #0x40]
	ldr r4, _0809F454 @ =0x0000A440
	str r4, [sp]
	bl sub_809C5EC
	ldr r0, [r5, #0x2c]
	subs r0, #1
	str r0, [r5, #0x2c]
	cmp r0, #0
	beq _0809F446
	ldr r0, _0809F458 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0809F44C
_0809F446:
	adds r0, r5, #0
	bl sub_8002DE4
_0809F44C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F454: .4byte 0x0000A440
_0809F458: .4byte 0x085775CC

