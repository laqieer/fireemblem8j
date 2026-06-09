	.syntax unified
	.set ClearFlag, 0x080860BC + 1
	.set SetFlag, 0x080860A8 + 1
	.section .text.sub_800D914, "ax", %progbits
@ sub_800D914 @ JP 0x0800D914 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D914
	.thumb_func
sub_800D914:
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x38]
	ldrh r1, [r2]
	movs r4, #7
	ands r4, r1
	movs r0, #0xf
	ands r0, r1
	lsrs r1, r0, #3
	movs r0, #2
	ldrsh r2, [r2, r0]
	cmp r2, #0
	bge _0800D934
	ldr r0, _0800D940 @ =0x030004B0
	movs r5, #8
	ldrsh r2, [r0, r5]
_0800D934:
	cmp r4, #0
	beq _0800D944
	cmp r4, #1
	beq _0800D960
	b _0800D972
	.align 2, 0
_0800D940: .4byte 0x030004B0
_0800D944:
	cmp r1, #0
	bne _0800D954
	movs r1, #1
	lsls r1, r2
	ldrh r0, [r3, #0x3c]
	bics r0, r1
	strh r0, [r3, #0x3c]
	b _0800D972
_0800D954:
	movs r0, #1
	lsls r0, r2
	ldrh r1, [r3, #0x3c]
	orrs r0, r1
	strh r0, [r3, #0x3c]
	b _0800D972
_0800D960:
	cmp r1, #0
	bne _0800D96C
	adds r0, r2, #0
	bl ClearFlag
	b _0800D972
_0800D96C:
	adds r0, r2, #0
	bl SetFlag
_0800D972:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

