	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.SetupDebugFontForOBJ, "ax", %progbits
@ SetupDebugFontForOBJ @ JP 0x08003A70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetupDebugFontForOBJ
	.thumb_func
SetupDebugFontForOBJ:
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	bge _08003A7E
	movs r2, #0xc0
	lsls r2, r2, #6
_08003A7E:
	ldr r0, _08003AE0 @ =0x0000FFFF
	ands r2, r0
	ldr r1, _08003AE4 @ =0x02028E50
	adds r0, r2, #0
	asrs r0, r0, #5
	str r0, [r1]
	ldr r1, _08003AE8 @ =0x02028E54
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	str r0, [r1]
	ldr r0, _08003AEC @ =0x085776F0
	movs r3, #0x80
	lsls r3, r3, #9
	adds r1, r2, r3
	ldr r2, _08003AF0 @ =0x0001FFFF
	ands r1, r2
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	ldr r3, _08003AF4 @ =0x020228A8
	adds r1, r4, #0
	adds r1, #0x10
	lsls r0, r1, #5
	adds r0, r0, r3
	movs r2, #0
	strh r2, [r0]
	lsls r1, r1, #4
	adds r0, r1, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	movs r2, #0xf8
	lsls r2, r2, #7
	strh r2, [r0]
	adds r1, #2
	lsls r1, r1, #1
	adds r1, r1, r3
	ldr r0, _08003AF8 @ =0x00007FFF
	strh r0, [r1]
	bl sub_8001EE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003AE0: .4byte 0x0000FFFF
_08003AE4: .4byte 0x02028E50
_08003AE8: .4byte 0x02028E54
_08003AEC: .4byte 0x085776F0
_08003AF0: .4byte 0x0001FFFF
_08003AF4: .4byte 0x020228A8
_08003AF8: .4byte 0x00007FFF

