	.syntax unified
	.set sub_80C8418, 0x080C8418 + 1
	.section .text.sub_800D08C, "ax", %progbits
@ sub_800D08C @ JP 0x0800D08C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D08C
	.thumb_func
sub_800D08C:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800D0A2
	bl sub_80C8418
	movs r0, #2
	b _0800D0A8
_0800D0A2:
	bl sub_80C8418
	movs r0, #0
_0800D0A8:
	pop {r1}
	bx r1

