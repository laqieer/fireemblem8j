	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8036288, "ax", %progbits
@ sub_8036288 @ JP 0x08036288 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036288
	.thumb_func
sub_8036288:
	push {r4, lr}
	adds r4, r0, #0
	bl GetSelectTargetCount
	cmp r0, #0
	bne _0803629C
	adds r0, r4, #0
	bl Proc_End
	b _080362A6
_0803629C:
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	str r0, [r4, #0x58]
_080362A6:
	pop {r4}
	pop {r0}
	bx r0

