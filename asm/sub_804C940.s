	.syntax unified
	.set InitWindowScanlineBounds, 0x08013288 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set Sio_SwapBoxTransitionBuffers, 0x0804C744 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_804C784, 0x0804C784 + 1
	.section .text.sub_804C940, "ax", %progbits
@ sub_804C940 @ JP 0x0804C940 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C940
	.thumb_func
sub_804C940:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x4c
	adds r5, r4, #0
	adds r5, #0x64
	movs r0, #0
	ldrsh r1, [r7, r0]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0804C968
	movs r0, #0
	bl SetPrimaryHBlankHandler
	adds r0, r4, #0
	bl sub_8002DE4
	b _0804C9CE
_0804C968:
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	movs r2, #0xc0
	bl sub_8012E84
	adds r6, r0, #0
	movs r2, #0x88
	lsls r2, r2, #1
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r1, #0
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	bl sub_8012E84
	adds r5, r0, #0
	ldr r4, _0804C9D8 @ =0x02001184
	ldr r0, [r4]
	bl InitWindowScanlineBounds
	ldr r0, [r4]
	movs r2, #0
	str r2, [sp]
	movs r1, #0xf0
	str r1, [sp, #4]
	movs r1, #0xa0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	str r6, [sp, #0x14]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #0x18]
	movs r1, #0
	movs r3, #0xf0
	bl sub_804C784
	bl Sio_SwapBoxTransitionBuffers
	ldrh r0, [r7]
	adds r0, #1
	strh r0, [r7]
_0804C9CE:
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C9D8: .4byte 0x02001184

