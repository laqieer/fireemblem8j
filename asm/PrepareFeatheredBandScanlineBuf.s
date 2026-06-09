	.syntax unified
	.set SwapScanlineBufs, 0x080846D0 + 1
	.section .text.PrepareFeatheredBandScanlineBuf, "ax", %progbits
@ PrepareFeatheredBandScanlineBuf @ JP 0x08084AA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrepareFeatheredBandScanlineBuf
	.thumb_func
PrepareFeatheredBandScanlineBuf:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r1, r0, #0
	cmp r1, #0x70
	ble _08084AB6
	movs r1, #0x70
_08084AB6:
	movs r0, #0x50
	subs r4, r0, r1
	adds r1, #0x50
	mov ip, r1
	cmp r4, #0
	ble _08084AD8
	ldr r0, _08084B98 @ =0x0203E750
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r2, #0
	ldr r0, [r0, #4]
	adds r2, r4, #0
_08084ACE:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bne _08084ACE
_08084AD8:
	mov r2, ip
	movs r7, #0x20
	adds r7, r7, r4
	mov sl, r7
	subs r0, r2, #1
	mov sb, r0
	adds r6, r2, #0
	subs r6, #0x20
	cmp r2, #0x9f
	bgt _08084B04
	ldr r0, _08084B98 @ =0x0203E750
	ldr r1, [r0, #4]
	movs r7, #0x80
	lsls r7, r7, #5
	adds r3, r7, #0
	lsls r0, r2, #1
	adds r0, r0, r1
_08084AFA:
	strh r3, [r0]
	adds r0, #2
	adds r2, #1
	cmp r2, #0x9f
	ble _08084AFA
_08084B04:
	adds r2, r4, #0
	cmp r2, #0x4f
	bgt _08084B36
	cmp r2, sl
	bge _08084B36
	ldr r0, _08084B98 @ =0x0203E750
	ldr r1, [r0, #4]
	movs r0, #0x10
	mov r8, r0
	mov r5, sl
	lsls r0, r2, #1
	adds r3, r0, r1
_08084B1C:
	subs r1, r2, r4
	asrs r1, r1, #1
	mov r7, r8
	subs r0, r7, r1
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r3]
	adds r3, #2
	adds r2, #1
	cmp r2, #0x4f
	bgt _08084B36
	cmp r2, r5
	blt _08084B1C
_08084B36:
	mov r2, sb
	cmp r2, #0x4f
	ble _08084B66
	adds r4, r6, #0
	cmp r2, r6
	blt _08084B66
	ldr r0, _08084B98 @ =0x0203E750
	ldr r1, [r0, #4]
	movs r5, #0x10
	lsls r0, r2, #1
	adds r3, r0, r1
_08084B4C:
	mov r0, ip
	subs r1, r0, r2
	asrs r1, r1, #1
	subs r0, r5, r1
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r3]
	subs r3, #2
	subs r2, #1
	cmp r2, #0x4f
	ble _08084B66
	cmp r2, r4
	bge _08084B4C
_08084B66:
	mov r2, sl
	adds r3, r6, #0
	cmp r2, r3
	bge _08084B84
	ldr r0, _08084B98 @ =0x0203E750
	ldr r1, [r0, #4]
	movs r4, #0x10
	lsls r0, r2, #1
	adds r0, r0, r1
	subs r2, r3, r2
_08084B7A:
	strh r4, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bne _08084B7A
_08084B84:
	bl SwapScanlineBufs
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084B98: .4byte 0x0203E750

