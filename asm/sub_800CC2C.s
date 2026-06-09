	.syntax unified
	.set sub_80C71D8, 0x080C71D8 + 1
	.section .text.sub_800CC2C, "ax", %progbits
@ sub_800CC2C @ JP 0x0800CC2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CC2C
	.thumb_func
sub_800CC2C:
	push {r4, lr}
	ldr r1, [r0, #0x38]
	movs r2, #4
	ldrsh r3, [r1, r2]
	movs r4, #6
	ldrsh r2, [r1, r4]
	ldr r4, [r1, #8]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CC52
	adds r0, r3, #0
	adds r1, r2, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_80C71D8
_0800CC52:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

