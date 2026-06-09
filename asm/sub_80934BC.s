	.syntax unified
	.set RegisterSioPid, 0x080975CC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80945E8, 0x080945E8 + 1
	.section .text.sub_80934BC, "ax", %progbits
@ sub_80934BC @ JP 0x080934BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80934BC
	.thumb_func
sub_80934BC:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r2, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x3a
	adds r6, r5, #0
	adds r6, #0x3b
	ldrb r0, [r0]
	ldrb r1, [r6]
	cmp r0, r1
	bls _08093540
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl RegisterSioPid
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	b _0809350C
_080934EE:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _08093534 @ =0x02022CA8
	bl sub_80945E8
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
_0809350C:
	cmp r4, r0
	bge _08093518
	ldr r0, _08093538 @ =0x0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt _080934EE
_08093518:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldr r0, _0809353C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093552
	movs r0, #0x6a
	bl m4aSongNumStart
	b _08093552
	.align 2, 0
_08093534: .4byte 0x02022CA8
_08093538: .4byte 0x0200F158
_0809353C: .4byte 0x0202BCEC
_08093540:
	ldr r0, _0809355C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08093552
	movs r0, #0x6c
	bl m4aSongNumStart
_08093552:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809355C: .4byte 0x0202BCEC

