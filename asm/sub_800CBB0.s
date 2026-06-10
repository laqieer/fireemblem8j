	.syntax unified
	.set sub_80C5088, 0x080C5088 + 1
	.section .text.sub_800CBB0, "ax", %progbits
@ sub_800CBB0 @ JP 0x0800CBB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CBB0
	.thumb_func
sub_800CBB0:
	push {lr}
	ldr r1, [r0, #0x38]
	ldrh r2, [r1, #4]
	ldrh r3, [r1, #6]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CBCC
	adds r0, r2, #0
	adds r1, r3, #0
	bl sub_80C5088
_0800CBCC:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

