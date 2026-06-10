	.syntax unified
	.set sub_80C83DC, 0x080C83DC + 1
	.section .text.sub_800D04C, "ax", %progbits
@ sub_800D04C @ JP 0x0800D04C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D04C
	.thumb_func
sub_800D04C:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800D064
	movs r0, #1
	bl sub_80C83DC
	movs r0, #2
	b _0800D066
_0800D064:
	movs r0, #0
_0800D066:
	pop {r1}
	bx r1
	.align 2, 0

