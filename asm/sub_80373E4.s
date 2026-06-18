	.syntax unified
	.set ResetTextFont, 0x08003C50 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80194BC, 0x080194BC + 1
	.section .text.sub_80373E4, "ax", %progbits
@ NewBattleForecast @ JP 0x080373E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewBattleForecast
	.thumb_func
NewBattleForecast:
	push {r4, lr}
	ldr r0, _080373FC @ =0x0202BCEC
	adds r4, r0, #0
	adds r4, #0x42
	ldrb r0, [r4]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne _08037400
	bl ResetTextFont
	b _08037440
	.align 2, 0
_080373FC: .4byte 0x0202BCEC
_08037400:
	ldr r0, _08037424 @ =0x085C6A48
	movs r1, #3
	bl sub_8002BCC
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x33
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r4]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _08037428
	cmp r0, #1
	beq _0803742E
	b _08037434
	.align 2, 0
_08037424: .4byte 0x085C6A48
_08037428:
	adds r1, #0x32
	movs r0, #1
	b _08037432
_0803742E:
	adds r1, #0x32
	movs r0, #2
_08037432:
	strb r0, [r1]
_08037434:
	ldr r0, _08037448 @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
_08037440:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037448: .4byte 0x0202E4DC

