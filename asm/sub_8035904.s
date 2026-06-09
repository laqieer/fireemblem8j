	.syntax unified
	.set BattleHitTerminate, 0x0802D1FC + 1
	.set sub_801907C, 0x0801907C + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.section .text.sub_8035904, "ax", %progbits
@ sub_8035904 @ JP 0x08035904 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035904
	.thumb_func
sub_8035904:
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_802CA5C
	ldr r5, _08035944 @ =0x0203A4E8
	adds r0, r5, #0
	adds r0, #0x48
	movs r1, #0x6c
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_801907C
	ldr r0, _08035948 @ =0x0203A604
	ldr r2, [r0]
	adds r0, r5, #0
	adds r0, #0x72
	ldrb r0, [r0]
	ldrb r1, [r5, #0x13]
	subs r0, r0, r1
	strb r0, [r2, #3]
	bl BattleHitTerminate
	bl sub_802C94C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08035944: .4byte 0x0203A4E8
_08035948: .4byte 0x0203A604

