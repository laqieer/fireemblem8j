	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.section .text.sub_800D77C, "ax", %progbits
@ sub_800D77C @ JP 0x0800D77C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D77C
	.thumb_func
sub_800D77C:
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D790
	movs r0, #1
	b _0800D792
_0800D790:
	movs r0, #0
_0800D792:
	pop {r1}
	bx r1
	.align 2, 0

