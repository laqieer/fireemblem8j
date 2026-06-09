	.syntax unified
	.set m4aMPlayVolumeControl, 0x080D5E9C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8002440, "ax", %progbits
@ sub_8002440 @ JP 0x08002440 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002440
	.thumb_func
sub_8002440:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	movs r2, #0x80
	lsls r2, r2, #1
	adds r6, r7, #0
	adds r6, #0x4c
	movs r0, #0
	ldrsh r3, [r6, r0]
	movs r1, #0x4e
	adds r1, r1, r7
	mov r8, r1
	movs r4, #0
	ldrsh r0, [r1, r4]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_8012E84
	adds r4, r0, #0
	ldr r0, _080024B4 @ =0x03006430
	ldr r5, _080024B8 @ =0x0000FFFF
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldr r0, _080024BC @ =0x03006640
	adds r1, r5, #0
	adds r2, r4, #0
	bl m4aMPlayVolumeControl
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _080024A6
	adds r0, r7, #0
	bl sub_8002DE4
	ldr r1, _080024C0 @ =0x03000038
	movs r0, #0
	str r0, [r1]
_080024A6:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080024B4: .4byte 0x03006430
_080024B8: .4byte 0x0000FFFF
_080024BC: .4byte 0x03006640
_080024C0: .4byte 0x03000038

