	.syntax unified
	.set m4aMPlayImmInit, 0x080D50E4 + 1
	.set m4aMPlayStop, 0x080D570C + 1
	.set m4aMPlayVolumeControl, 0x080D5E9C + 1
	.set sub_80027E0, 0x080027E0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80024C4, "ax", %progbits
@ sub_80024C4 @ JP 0x080024C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80024C4
	.thumb_func
sub_80024C4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	mov sl, r1
	mov sb, r2
	ldr r0, _08002554 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r7, r0, #0x1f
	cmp r7, #0
	bne _08002546
	ldr r0, _08002558 @ =0x02024E5C
	movs r1, #1
	strb r1, [r0, #6]
	strb r7, [r0, #7]
	strh r6, [r0, #4]
	ldr r0, _0800255C @ =0x08577608
	movs r1, #3
	bl sub_8002BCC
	mov r8, r0
	ldr r4, _08002560 @ =0x03006430
	adds r0, r4, #0
	bl m4aMPlayStop
	ldr r5, _08002564 @ =0x03006640
	adds r0, r5, #0
	bl m4aMPlayStop
	adds r0, r6, #0
	mov r1, sb
	bl sub_80027E0
	adds r0, r4, #0
	bl m4aMPlayImmInit
	adds r0, r5, #0
	bl m4aMPlayImmInit
	ldr r6, _08002568 @ =0x0000FFFF
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl m4aMPlayVolumeControl
	mov r0, r8
	adds r0, #0x4c
	strh r7, [r0]
	mov r1, sl
	lsls r0, r1, #4
	mov r2, r8
	adds r2, #0x4e
	strh r0, [r2]
	ldr r0, _0800256C @ =0x03000038
	mov r1, r8
	str r1, [r0]
_08002546:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002554: .4byte 0x0202BCEC
_08002558: .4byte 0x02024E5C
_0800255C: .4byte 0x08577608
_08002560: .4byte 0x03006430
_08002564: .4byte 0x03006640
_08002568: .4byte 0x0000FFFF
_0800256C: .4byte 0x03000038

