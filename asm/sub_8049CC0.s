	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8049CC0, "ax", %progbits
@ sub_8049CC0 @ JP 0x08049CC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049CC0
	.thumb_func
sub_8049CC0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x4c
	adds r0, r0, r7
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	bgt _08049D52
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r0, sb
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	bl sub_8012E84
	mov sl, r0
	ldr r4, _08049DC0 @ =0x080DC15C
	ldr r2, _08049DC4 @ =0x080DC1DC
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
	ldr r2, _08049DC4 @ =0x080DC1DC
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
_08049D52:
	ldr r0, [r7, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r5, _08049DC8 @ =0x085B8D24
	ldr r3, _08049DCC @ =0x00009350
	adds r2, r5, #0
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r7, #0x2c]
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r3, _08049DD0 @ =0x00009354
	adds r2, r5, #0
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r7, #0x2c]
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r1, [r7, #0x30]
	adds r1, r1, r4
	ldr r2, _08049DD4 @ =0x085B8CE4
	ldr r3, _08049DD8 @ =0x00009358
	bl CallARM_PushToSecondaryOAM
	mov r1, sb
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x40
	ble _08049DAE
	movs r0, #0
	strh r0, [r1]
	adds r0, r7, #0
	bl sub_8002DE4
_08049DAE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049DC0: .4byte 0x080DC15C
_08049DC4: .4byte 0x080DC1DC
_08049DC8: .4byte 0x085B8D24
_08049DCC: .4byte 0x00009350
_08049DD0: .4byte 0x00009354
_08049DD4: .4byte 0x085B8CE4
_08049DD8: .4byte 0x00009358

