	.syntax unified
	.set MPlayJumpTableCopy, 0x080D4650 + 1
	.set sub_80D5368, 0x080D5368 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.SoundInit, "ax", %progbits
@ SoundInit @ JP 0x080D5270 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SoundInit
	.thumb_func
SoundInit:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r3, #0
	str r3, [r5]
	ldr r1, _080D5328 @ =0x040000C4
	ldr r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x12
	ands r0, r2
	cmp r0, #0
	beq _080D528C
	ldr r0, _080D532C @ =0x84400004
	str r0, [r1]
_080D528C:
	ldr r1, _080D5330 @ =0x040000D0
	ldr r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _080D529A
	ldr r0, _080D532C @ =0x84400004
	str r0, [r1]
_080D529A:
	ldr r0, _080D5334 @ =0x040000C6
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	ldr r1, _080D5338 @ =0x04000084
	movs r0, #0x8f
	strh r0, [r1]
	subs r1, #2
	ldr r2, _080D533C @ =0x0000A90E
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _080D5340 @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080D5344 @ =0x040000BC
	movs r2, #0xd4
	lsls r2, r2, #2
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _080D5348 @ =0x040000A0
	str r0, [r1]
	adds r1, #8
	movs r2, #0x98
	lsls r2, r2, #4
	adds r0, r5, r2
	str r0, [r1]
	adds r1, #4
	ldr r0, _080D534C @ =0x040000A4
	str r0, [r1]
	ldr r0, _080D5350 @ =0x03007FF0
	str r5, [r0]
	str r3, [sp]
	ldr r2, _080D5354 @ =0x050003EC
	mov r0, sp
	adds r1, r5, #0
	bl sub_80D6370
	movs r0, #8
	strb r0, [r5, #6]
	movs r0, #0xf
	strb r0, [r5, #7]
	ldr r0, _080D5358 @ =ply_note
	str r0, [r5, #0x38]
	ldr r0, _080D535C @ =nullsub_4
	str r0, [r5, #0x28]
	str r0, [r5, #0x2c]
	str r0, [r5, #0x30]
	str r0, [r5, #0x3c]
	ldr r4, _080D5360 @ =0x03006470
	adds r0, r4, #0
	bl MPlayJumpTableCopy
	str r4, [r5, #0x34]
	movs r0, #0x80
	lsls r0, r0, #0xb
	bl sub_80D5368
	ldr r0, _080D5364 @ =0x68736D53
	str r0, [r5]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D5328: .4byte 0x040000C4
_080D532C: .4byte 0x84400004
_080D5330: .4byte 0x040000D0
_080D5334: .4byte 0x040000C6
_080D5338: .4byte 0x04000084
_080D533C: .4byte 0x0000A90E
_080D5340: .4byte 0x04000089
_080D5344: .4byte 0x040000BC
_080D5348: .4byte 0x040000A0
_080D534C: .4byte 0x040000A4
_080D5350: .4byte 0x03007FF0
_080D5354: .4byte 0x050003EC
_080D5358: .4byte 0x080D4B3D  @ ply_note
_080D535C: .4byte 0x080D6361  @ nullsub_4
_080D5360: .4byte 0x03006470
_080D5364: .4byte 0x68736D53

