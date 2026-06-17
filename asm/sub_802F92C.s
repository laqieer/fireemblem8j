	.syntax unified
	.set GetItemIconId, 0x080174A8 + 1
	.set GetUnit, 0x08019108 + 1
	.set NewPopup2_PlanB, 0x0801F6E4 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set ApplyJunaFruitItem, 0x0802F8C4 + 1
	.section .text.sub_802F92C, "ax", %progbits
@ sub_802F92C @ JP 0x0802F92C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802F92C
	.thumb_func
sub_802F92C:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _0802F98C @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r2, [r4, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r5, [r1]
	ldr r1, _0802F990 @ =0x0203A568
	adds r1, #0x6f
	movs r2, #0xff
	strb r2, [r1]
	ldrb r1, [r4, #0x12]
	bl ApplyJunaFruitItem
	adds r6, r0, #0
	ldr r0, _0802F994 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802F968
	movs r0, #0x5a
	bl m4aSongNumStart
_0802F968:
	adds r0, r5, #0
	bl GetItemIconId
	adds r4, r0, #0
	ldr r0, _0802F998 @ =0x0000081D
	bl sub_8009FA8
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl NewPopup2_PlanB
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F98C: .4byte 0x0203A954
_0802F990: .4byte 0x0203A568
_0802F994: .4byte 0x0202BCEC
_0802F998: .4byte 0x0000081D

