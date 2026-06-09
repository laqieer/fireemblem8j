	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8085500, 0x08085500 + 1
	.set sub_8085544, 0x08085544 + 1
	.section .text.sub_802FF04, "ax", %progbits
@ sub_802FF04 @ JP 0x0802FF04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802FF04
	.thumb_func
sub_802FF04:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0802FF58 @ =0x0203A4E8
	adds r0, #0x7e
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0802FF5C @ =0x0203A954
	movs r4, #0x13
	ldrsb r4, [r0, r4]
	movs r5, #0x14
	ldrsb r5, [r0, r5]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8085544
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8085500
	ldr r0, _0802FF60 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802FF3C
	movs r0, #0xb1
	bl m4aSongNumStart
_0802FF3C:
	ldr r1, _0802FF64 @ =0x0203A568
	adds r1, #0x6f
	movs r0, #0xff
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _0802FF52
	ldr r0, _0802FF68 @ =0x085C42F0
	adds r1, r6, #0
	bl Proc_StartBlocking
_0802FF52:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FF58: .4byte 0x0203A4E8
_0802FF5C: .4byte 0x0203A954
_0802FF60: .4byte 0x0202BCEC
_0802FF64: .4byte 0x0203A568
_0802FF68: .4byte 0x085C42F0

