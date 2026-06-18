	.syntax unified
	.set CheckEkrHitDone, 0x08052FC4 + 1
	.set EkrDragonTmCpyWithDistance, 0x08072168 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set Proc_BreakEach, 0x08002FE4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_80720DC, 0x080720DC + 1
	.set sub_80795EC, 0x080795EC + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_807949C, "ax", %progbits
@ EkrDragonBodyAnimeMain @ JP 0x0807949C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EkrDragonBodyAnimeMain
	.thumb_func
EkrDragonBodyAnimeMain:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	ldrb r1, [r0, #0x12]
	ldr r0, [r4, #0x54]
	cmp r0, r1
	beq _08079510
	adds r2, r1, #0
	str r2, [r4, #0x54]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	str r0, [r4, #0x44]
	cmp r2, #9
	bhi _08079510
	lsls r0, r2, #2
	ldr r1, _080794C4 @ =_080794C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080794C4: .4byte _080794C8
_080794C8: @ jump table
	.4byte _080794F0 @ case 0
	.4byte _080794F0 @ case 1
	.4byte _080794F0 @ case 2
	.4byte _080794F0 @ case 3
	.4byte _08079504 @ case 4
	.4byte _08079504 @ case 5
	.4byte _0807950C @ case 6
	.4byte _0807950C @ case 7
	.4byte _0807950C @ case 8
	.4byte _080794F0 @ case 9
_080794F0:
	ldr r0, _08079500 @ =0x080ED6F8
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x5c]
	adds r1, r2, #0
	bl sub_80795EC
	b _08079510
	.align 2, 0
_08079500: .4byte 0x080ED6F8
_08079504:
	ldr r0, _08079508 @ =0x080ED76E
	b _0807950E
	.align 2, 0
_08079508: .4byte 0x080ED76E
_0807950C:
	ldr r0, _08079548 @ =0x080ED6F8
_0807950E:
	str r0, [r4, #0x48]
_08079510:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r1, r2, #0
	cmp r2, #0
	blt _08079554
	ldr r1, [r4, #0x4c]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _0807954C @ =0x02019790
	bl sub_80D6394
	bl EkrDragonTmCpyWithDistance
	ldr r0, _08079550 @ =0x0201FB0C
	ldr r0, [r0]
	movs r1, #0
	bl sub_80720DC
	b _080795E6
	.align 2, 0
_08079548: .4byte 0x080ED6F8
_0807954C: .4byte 0x02019790
_08079550: .4byte 0x0201FB0C
_08079554:
	movs r0, #5
	rsbs r0, r0, #0
	cmp r2, r0
	beq _080795A0
	cmp r2, r0
	bgt _08079568
	subs r0, #1
	cmp r2, r0
	beq _08079572
	b _080795E6
_08079568:
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080795C4
	b _080795E6
_08079572:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0807958C
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	ldrh r1, [r0, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080795E6
	b _080795CC
_0807958C:
	bl CheckEkrHitDone
	cmp r0, #1
	bne _080795E6
	ldr r0, _0807959C @ =0x08848A08
	bl Proc_BreakEach
	b _080795DA
	.align 2, 0
_0807959C: .4byte 0x08848A08
_080795A0:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _080795CC
	ldr r0, [r4, #0x5c]
	ldrh r1, [r0, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080795E6
	ldr r0, _080795C0 @ =0x08848A08
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x4c]
	b _080795DA
	.align 2, 0
_080795C0: .4byte 0x08848A08
_080795C4:
	movs r1, #0x2e
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080795D2
_080795CC:
	movs r0, #1
	strh r0, [r4, #0x2e]
	b _080795E6
_080795D2:
	bl CheckEkrHitDone
	cmp r0, #1
	bne _080795E6
_080795DA:
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
_080795E6:
	pop {r4}
	pop {r0}
	bx r0

