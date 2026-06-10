	.syntax unified
	.set sub_80C83DC, 0x080C83DC + 1
	.section .text.sub_800D06C, "ax", %progbits
@ sub_800D06C @ JP 0x0800D06C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D06C
	.thumb_func
sub_800D06C:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800D084
	movs r0, #0
	bl sub_80C83DC
	movs r0, #2
	b _0800D086
_0800D084:
	movs r0, #0
_0800D086:
	pop {r1}
	bx r1
	.align 2, 0

