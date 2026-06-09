	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetEfxHp, 0x08059890 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80532DC, "ax", %progbits
@ sub_80532DC @ JP 0x080532DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80532DC
	.thumb_func
sub_80532DC:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _08053314 @ =0x02017728
	ldr r0, [r1]
	cmp r0, #0
	bne _080533AA
	movs r0, #1
	str r0, [r1]
	ldr r0, _08053318 @ =0x085E380C
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r6, #0x64]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08053320
	ldr r0, _0805331C @ =0x02000000
	ldr r1, [r0, #8]
	str r1, [r6, #0x5c]
	ldr r0, [r0]
	b _08053328
	.align 2, 0
_08053314: .4byte 0x02017728
_08053318: .4byte 0x085E380C
_0805331C: .4byte 0x02000000
_08053320:
	ldr r0, _08053378 @ =0x02000000
	ldr r1, [r0]
	str r1, [r6, #0x5c]
	ldr r0, [r0, #8]
_08053328:
	str r0, [r6, #0x60]
	ldr r4, _0805337C @ =0x0203E14E
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r4, r5, #1
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r5, r5, #1
	adds r5, r5, r0
	adds r0, r5, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x4c]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	lsls r4, r4, #1
	adds r4, r4, r0
	adds r0, r4, #0
	bl GetEfxHp
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [r6, #0x50]
	ldr r1, [r6, #0x4c]
	cmp r1, r0
	ble _08053380
	movs r0, #1
	rsbs r0, r0, #0
	b _08053382
	.align 2, 0
_08053378: .4byte 0x02000000
_0805337C: .4byte 0x0203E14E
_08053380:
	movs r0, #1
_08053382:
	str r0, [r6, #0x48]
	adds r0, r6, #0
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #0x4c]
	strh r0, [r6, #0x2e]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	ldr r0, _080533B0 @ =0x02017750
	str r1, [r0]
	ldr r0, [r6, #0x60]
	bl GetAnimPosition
	ldr r1, _080533B4 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
_080533AA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080533B0: .4byte 0x02017750
_080533B4: .4byte 0x02017780

