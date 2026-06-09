	.syntax unified
	.set PutSparkGfxRotation, 0x08081A64 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8081AC8, "ax", %progbits
@ sub_8081AC8 @ JP 0x08081AC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8081AC8
	.thumb_func
sub_8081AC8:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	movs r0, #0x30
	ldrsh r2, [r5, r0]
	ldrh r3, [r5, #0x3a]
	ldrh r0, [r5, #0x3e]
	str r0, [sp]
	movs r0, #5
	bl sub_8012E84
	lsls r0, r0, #4
	strh r0, [r5, #0x36]
	asrs r0, r0, #1
	strh r0, [r5, #0x38]
	ldr r6, _08081B34 @ =0x03005080
	movs r7, #0xf
_08081AEE:
	movs r1, #0x2a
	ldrsh r0, [r5, r1]
	movs r2, #0x2c
	ldrsh r1, [r5, r2]
	ldrh r2, [r5, #0x36]
	ldrh r3, [r6]
	adds r2, r2, r3
	asrs r2, r2, #4
	ldrh r3, [r5, #0x38]
	ldrh r4, [r6, #2]
	adds r3, r3, r4
	asrs r3, r3, #4
	bl PutSparkGfxRotation
	adds r6, #8
	subs r7, #1
	cmp r7, #0
	bge _08081AEE
	ldrh r0, [r5, #0x3a]
	adds r0, #1
	strh r0, [r5, #0x3a]
	adds r1, r5, #0
	adds r1, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	cmp r0, r1
	bls _08081B2C
	adds r0, r5, #0
	bl sub_8002DE4
_08081B2C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081B34: .4byte 0x03005080

