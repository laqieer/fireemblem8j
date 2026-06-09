	.syntax unified
	.set sub_80C5024, 0x080C5024 + 1
	.section .text.sub_800CB8C, "ax", %progbits
@ sub_800CB8C @ JP 0x0800CB8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CB8C
	.thumb_func
sub_800CB8C:
	push {lr}
	ldr r1, [r0, #0x38]
	ldrh r2, [r1, #4]
	ldrh r3, [r1, #6]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CBA8
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80C5024
_0800CBA8:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

