	.syntax unified
	.set nullsub_23, 0x080BD054 + 1
	.section .text.sub_800D0BC, "ax", %progbits
@ sub_800D0BC @ JP 0x0800D0BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D0BC
	.thumb_func
sub_800D0BC:
	push {r4, r5, lr}
	ldr r1, [r0, #0x38]
	movs r2, #2
	ldrsh r4, [r1, r2]
	movs r5, #4
	ldrsh r3, [r1, r5]
	movs r5, #6
	ldrsh r2, [r1, r5]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800D0E2
	adds r0, r3, #0
	adds r1, r2, #0
	adds r2, r4, #0
	bl nullsub_23
_0800D0E2:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

