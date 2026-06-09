	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8030664, "ax", %progbits
@ sub_8030664 @ JP 0x08030664 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030664
	.thumb_func
sub_8030664:
	push {lr}
	ldr r0, _0803069C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x5f
	bls _08030696
	cmp r0, #0x9f
	bhi _08030696
	adds r2, r0, #0
	subs r2, #0x60
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _080306A0 @ =0x02002ADC
	lsls r1, r2, #4
	adds r0, r1, r0
	movs r1, #7
	ands r1, r2
	lsls r1, r1, #4
	ldr r2, _080306A4 @ =0x050000E0
	adds r1, r1, r2
	movs r2, #2
	bl sub_80D636C
_08030696:
	pop {r0}
	bx r0
	.align 2, 0
_0803069C: .4byte 0x04000006
_080306A0: .4byte 0x02002ADC
_080306A4: .4byte 0x050000E0

