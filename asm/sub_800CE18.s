	.syntax unified
	.set sub_80C7E04, 0x080C7E04 + 1
	.set sub_80C7E98, 0x080C7E98 + 1
	.section .text.sub_800CE18, "ax", %progbits
@ sub_800CE18 @ JP 0x0800CE18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CE18
	.thumb_func
sub_800CE18:
	push {lr}
	ldr r1, [r0, #0x38]
	ldr r2, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CE32
	adds r0, r2, #0
	bl sub_80C7E98
	b _0800CE3A
_0800CE32:
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_80C7E04
_0800CE3A:
	movs r0, #0
	pop {r1}
	bx r1

