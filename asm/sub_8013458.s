	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8001EF0, 0x08001EF0 + 1
	.section .text.sub_8013458, "ax", %progbits
@ sub_8013458 @ JP 0x08013458 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013458
	.thumb_func
sub_8013458:
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r7, _08013474 @ =0x02020188
	movs r6, #0
	adds r5, r7, #0
	ldr r4, _08013478 @ =0x020228A8
_08013464:
	ldrh r1, [r4]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, r3
	blt _0801347C
	subs r1, r1, r3
	b _08013480
	.align 2, 0
_08013474: .4byte 0x02020188
_08013478: .4byte 0x020228A8
_0801347C:
	ldr r0, _08013490 @ =0x0000FFE0
	ands r1, r0
_08013480:
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsls r2, r3, #5
	cmp r0, r2
	blt _08013494
	subs r1, r1, r2
	b _08013498
	.align 2, 0
_08013490: .4byte 0x0000FFE0
_08013494:
	ldr r0, _080134A8 @ =0x0000FC1F
	ands r1, r0
_08013498:
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r0, r1
	lsls r2, r3, #0xa
	cmp r0, r2
	blt _080134AC
	subs r1, r1, r2
	b _080134B0
	.align 2, 0
_080134A8: .4byte 0x0000FC1F
_080134AC:
	ldr r0, _080134D8 @ =0x000003FF
	ands r1, r0
_080134B0:
	strh r1, [r5]
	adds r5, #2
	adds r4, #2
	adds r6, #1
	ldr r0, _080134DC @ =0x000001FF
	cmp r6, r0
	ble _08013464
	bl sub_8001EF0
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r7, #0
	bl RegisterDataMove
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080134D8: .4byte 0x000003FF
_080134DC: .4byte 0x000001FF

