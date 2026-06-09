	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8013048, 0x08013048 + 1
	.set sub_804EE2C, 0x0804EE2C + 1
	.section .text.sub_804EEEC, "ax", %progbits
@ sub_804EEEC @ JP 0x0804EEEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804EEEC
	.thumb_func
sub_804EEEC:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	cmp r5, #0
	bge _0804EEFE
	ldr r0, _0804EF34 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r5, r0, #0x1e
_0804EEFE:
	ldr r0, _0804EF38 @ =0x085E0650
	lsls r5, r5, #2
	adds r5, r5, r0
	ldr r0, [r5]
	bl sub_8013048
	adds r6, r0, #0
	ldr r4, _0804EF3C @ =0x02022288
	subs r4, r4, r6
	ldr r0, [r5]
	adds r1, r4, #0
	bl sub_8013008
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r6, #0
	bl RegisterDataMove
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_804EE2C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804EF34: .4byte 0x0202BCEC
_0804EF38: .4byte 0x085E0650
_0804EF3C: .4byte 0x02022288

