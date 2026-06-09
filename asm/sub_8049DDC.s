	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8049DDC, "ax", %progbits
@ sub_8049DDC @ JP 0x08049DDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049DDC
	.thumb_func
sub_8049DDC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x4c
	str r0, [sp, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	bgt _08049E72
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	ldr r0, [sp, #4]
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	mov r1, r8
	movs r2, #0x10
	bl sub_8012E84
	mov sl, r0
	ldr r4, _08049EDC @ =0x080DC15C
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	mov r1, sl
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
_08049E72:
	ldr r0, [r7, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, _08049EE0 @ =0x085B8D24
	ldr r3, _08049EE4 @ =0x00009350
	adds r2, r5, #0
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r7, #0x2c]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r3, _08049EE8 @ =0x00009354
	adds r2, r5, #0
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r7, #0x2c]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r2, _08049EEC @ =0x085B8CE4
	ldr r3, _08049EF0 @ =0x00009358
	bl CallARM_PushToSecondaryOAM
	ldr r1, [sp, #4]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	ble _08049ECA
	adds r0, r7, #0
	bl sub_8002DE4
_08049ECA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049EDC: .4byte 0x080DC15C
_08049EE0: .4byte 0x085B8D24
_08049EE4: .4byte 0x00009350
_08049EE8: .4byte 0x00009354
_08049EEC: .4byte 0x085B8CE4
_08049EF0: .4byte 0x00009358

