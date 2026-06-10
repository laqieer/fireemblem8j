	.syntax unified
	.set StartBgmVolumeChange, 0x08002680 + 1
	.set sub_80124DC, 0x080124DC + 1
	.set sub_80AEFFC, 0x080AEFFC + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8034014, "ax", %progbits
@ sub_8034014 @ JP 0x08034014 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034014
	.thumb_func
sub_8034014:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _0803406C @ =0x0202BCEC
	adds r4, r2, #0
	adds r4, #0x4a
	ldrb r1, [r4]
	movs r5, #0xf
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r2, #0x14]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0803404E
	bl sub_80C1E74
	subs r0, #1
	cmp r0, #1
	bhi _0803404E
	ldrb r0, [r4]
	adds r1, r5, #0
	ands r1, r0
	movs r0, #8
	orrs r1, r0
	strb r1, [r4]
_0803404E:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	bl sub_80124DC
	adds r0, r6, #0
	bl sub_80AEFFC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803406C: .4byte 0x0202BCEC

