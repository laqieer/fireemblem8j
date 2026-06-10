	.syntax unified
	.set sub_80C7290, 0x080C7290 + 1
	.set sub_80C72B0, 0x080C72B0 + 1
	.section .text.sub_800CC5C, "ax", %progbits
@ sub_800CC5C @ JP 0x0800CC5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CC5C
	.thumb_func
sub_800CC5C:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CC70
	bl sub_80C7290
	b _0800CC74
_0800CC70:
	bl sub_80C72B0
_0800CC74:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

