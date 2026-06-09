	.syntax unified
	.set UpdateMapAnimScanline, 0x08084264 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8009608, 0x08009608 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8080BF0, "ax", %progbits
@ sub_8080BF0 @ JP 0x08080BF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080BF0
	.thumb_func
sub_8080BF0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x48
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #5
	movs r1, #1
	movs r2, #0x10
	bl sub_8012E84
	adds r2, r0, #0
	ldrh r0, [r4]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	ldr r1, [r7, #0x34]
	bl UpdateMapAnimScanline
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x1d
	ble _08080C60
	mov r0, r8
	strh r0, [r4]
	adds r0, r7, #0
	bl sub_8002DE4
	ldr r5, _08080C6C @ =0x08A168DC
	ldr r1, [r7, #0x30]
	ldr r2, [r7, #0x34]
	ldr r6, _08080C70 @ =0x000041C0
	mov r0, r8
	str r0, [sp]
	movs r4, #2
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r3, r6, #0
	bl sub_8009608
	ldr r1, [r7, #0x30]
	ldr r2, [r7, #0x34]
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	adds r3, r6, #0
	bl sub_8009608
_08080C60:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080C6C: .4byte 0x08A168DC
_08080C70: .4byte 0x000041C0

