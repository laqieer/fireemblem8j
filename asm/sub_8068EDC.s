	.syntax unified
	.set sub_8001EF0, 0x08001EF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8054E1C, 0x08054E1C + 1
	.set sub_8073820, 0x08073820 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8068EDC, "ax", %progbits
@ sub_8068EDC @ JP 0x08068EDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8068EDC
	.thumb_func
sub_8068EDC:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_8012E84
	adds r6, r0, #0
	ldr r0, _08068F50 @ =0x020228A8
	ldr r4, _08068F54 @ =0x020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80D636C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl sub_8073820
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_80D636C
	bl sub_8001EF0
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r7, r2]
	cmp r0, r1
	ble _08068F46
	ldr r0, [r7, #0x5c]
	movs r1, #0
	movs r2, #0x20
	bl sub_8054E1C
	adds r0, r7, #0
	bl sub_8002DE4
_08068F46:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068F50: .4byte 0x020228A8
_08068F54: .4byte 0x020165C8

