	.syntax unified
	.set CheckEkrDragonDead, 0x080727C4 + 1
	.set CheckEkrNamewinAppearUnexist, 0x08057DE8 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.section .text.sub_8051334, "ax", %progbits
@ sub_8051334 @ JP 0x08051334 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051334
	.thumb_func
sub_8051334:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080513A0 @ =0x02017728
	ldr r0, [r0]
	cmp r0, #0
	bne _0805139A
	ldr r0, _080513A4 @ =0x02017738
	ldr r4, [r0]
	cmp r4, #0
	bne _0805139A
	bl CheckEkrNamewinAppearUnexist
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #1
	bne _0805139A
	strh r4, [r5, #0x2c]
	ldr r0, _080513A8 @ =sub_80513B8
	str r0, [r5, #0xc]
	ldr r4, _080513AC @ =0x02000000
	ldr r0, [r4]
	bl CheckEkrDragonDead
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805139A
	ldr r0, _080513B0 @ =0x0203E1C4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #1
	cmp r0, #0
	beq _08051376
	movs r2, #0
_08051376:
	ldr r3, _080513B4 @ =0x02017744
	ldr r0, [r3]
	adds r1, r5, #0
	adds r1, #0x29
	cmp r2, r0
	beq _08051384
	strb r6, [r1]
_08051384:
	ldrb r0, [r1]
	cmp r0, #1
	bne _0805139A
	ldr r0, [r3]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_0805139A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080513A0: .4byte 0x02017728
_080513A4: .4byte 0x02017738
_080513A8: .4byte 0x080513B9  @ sub_80513B8
_080513AC: .4byte 0x02000000
_080513B0: .4byte 0x0203E1C4
_080513B4: .4byte 0x02017744

