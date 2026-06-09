	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8073820, 0x08073820 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8067884, "ax", %progbits
@ sub_8067884 @ JP 0x08067884 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067884
	.thumb_func
sub_8067884:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r1, r0
	ble _0806789E
	ldrh r3, [r5, #0x2e]
	b _080678A0
_0806789E:
	ldrh r3, [r5, #0x2c]
_080678A0:
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_8012E84
	adds r4, r0, #0
	ldr r7, _08067908 @ =0x020165C8
	ldr r6, _0806790C @ =0x020228A8
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_80D636C
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r4, #0
	bl sub_8073820
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _080678FA
	adds r0, r7, #0
	adds r1, r6, #0
	mov r2, r8
	bl sub_80D636C
	ldr r1, _08067910 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r5, #0
	bl sub_8002DE4
_080678FA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08067908: .4byte 0x020165C8
_0806790C: .4byte 0x020228A8
_08067910: .4byte 0x0201774C

