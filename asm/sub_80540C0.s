	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80540C0, "ax", %progbits
@ NewEfxFarAttackWithDistance @ JP 0x080540C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEfxFarAttackWithDistance
	.thumb_func
NewEfxFarAttackWithDistance:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	ldr r0, _080540DC @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0805418A
	lsls r0, r0, #2
	ldr r1, _080540E0 @ =_080540E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080540DC: .4byte 0x0203E11C
_080540E0: .4byte _080540E4
_080540E4: @ jump table
	.4byte _0805418A @ case 0
	.4byte _080540F8 @ case 1
	.4byte _080540F8 @ case 2
	.4byte _0805418A @ case 3
	.4byte _0805418A @ case 4
_080540F8:
	ldr r0, _08054128 @ =0x085E39A4
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetAnimPosition
	adds r2, r4, #0
	adds r2, #0x29
	movs r1, #0
	strb r0, [r2]
	strh r1, [r4, #0x2c]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _08054130
	asrs r0, r5, #1
	strh r0, [r4, #0x2e]
	subs r0, r5, r0
	strh r0, [r4, #0x30]
	ldr r2, _0805412C @ =0x0203E11C
	b _0805414A
	.align 2, 0
_08054128: .4byte 0x085E39A4
_0805412C: .4byte 0x0203E11C
_08054130:
	ldr r0, _08054140 @ =0x0203E11C
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #1
	bne _08054144
	movs r0, #5
	b _08054146
	.align 2, 0
_08054140: .4byte 0x0203E11C
_08054144:
	movs r0, #7
_08054146:
	strh r0, [r4, #0x2e]
	strh r0, [r4, #0x30]
_0805414A:
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #0xf0
	cmp r0, #1
	bne _08054156
	movs r1, #0x20
_08054156:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r2, [r0]
	cmp r2, #0
	bne _0805416E
	rsbs r0, r1, #0
	strh r0, [r4, #0x32]
	lsrs r0, r0, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r2, [r4, #0x38]
	b _0805417C
_0805416E:
	movs r0, #0
	strh r0, [r4, #0x32]
	rsbs r1, r1, #0
	lsrs r0, r1, #1
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	strh r1, [r4, #0x38]
_0805417C:
	ldr r1, _08054190 @ =0x0201FB0C
	movs r2, #0x32
	ldrsh r0, [r4, r2]
	str r0, [r1]
	ldr r1, _08054194 @ =0x02017748
	movs r0, #1
	str r0, [r1]
_0805418A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054190: .4byte 0x0201FB0C
_08054194: .4byte 0x02017748

