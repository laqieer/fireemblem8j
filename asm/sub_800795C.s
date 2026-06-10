	.syntax unified
	.set GetFaceIdByXPos, 0x0800785C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8008830, 0x08008830 + 1
	.section .text.sub_800795C, "ax", %progbits
@ sub_800795C @ JP 0x0800795C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800795C
	.thumb_func
sub_800795C:
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	lsls r2, r2, #0x18
	asrs r7, r2, #0x18
	bl sub_8008830
	lsls r0, r0, #3
	bl GetFaceIdByXPos
	adds r5, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _0800799E
	ldr r0, _080079A4 @ =0x085B9148
	ldr r1, _080079A8 @ =0x03004920
	lsls r4, r5, #2
	adds r4, r4, r1
	ldr r1, [r4]
	bl sub_8002BCC
	adds r2, r0, #0
	adds r0, #0x64
	strh r5, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r0, [r4]
	ldrh r1, [r0, #0x34]
	adds r0, r2, #0
	adds r0, #0x68
	strh r1, [r0]
	adds r0, #2
	strh r7, [r0]
_0800799E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080079A4: .4byte 0x085B9148
_080079A8: .4byte 0x03004920

