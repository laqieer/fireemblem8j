	.syntax unified
	.set sub_80D6374, 0x080D6374 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_8014328, "ax", %progbits
@ sub_8014328 @ JP 0x08014328 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014328
	.thumb_func
sub_8014328:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r6, r1, #0
	movs r5, #0
	cmp r4, #0
	bne _08014350
	ldr r0, _0801434C @ =0x085C2570
	ldrb r1, [r0]
	strb r1, [r6]
	adds r6, #1
	ldrb r0, [r0, #1]
	strb r0, [r6]
	strb r4, [r6, #1]
	movs r0, #1
	b _080143DC
	.align 2, 0
_0801434C: .4byte 0x085C2570
_08014350:
	cmp r4, #0
	bge _08014362
	ldr r0, _0801436C @ =0x085C2574
	ldrb r1, [r0]
	strb r1, [r6]
	ldrb r0, [r0, #1]
	strb r0, [r6, #1]
	rsbs r4, r4, #0
	movs r5, #2
_08014362:
	ldr r0, _08014370 @ =0x0001869F
	cmp r4, r0
	ble _08014374
	adds r5, #0xa
	b _080143A2
	.align 2, 0
_0801436C: .4byte 0x085C2574
_08014370: .4byte 0x0001869F
_08014374:
	ldr r0, _08014380 @ =0x0000270F
	cmp r4, r0
	ble _08014384
	adds r5, #8
	b _080143A2
	.align 2, 0
_08014380: .4byte 0x0000270F
_08014384:
	ldr r0, _08014390 @ =0x000003E7
	cmp r4, r0
	ble _08014394
	adds r5, #6
	b _080143A2
	.align 2, 0
_08014390: .4byte 0x000003E7
_08014394:
	cmp r4, #0x63
	ble _0801439C
	adds r5, #4
	b _080143A2
_0801439C:
	cmp r4, #9
	ble _080143A2
	adds r5, #2
_080143A2:
	mov r8, r5
	cmp r4, #0
	ble _080143CE
	ldr r7, _080143E8 @ =0x085C2570
_080143AA:
	adds r0, r4, #0
	movs r1, #0xa
	bl sub_80D637C
	adds r2, r6, r5
	ldrb r1, [r7]
	strb r1, [r2]
	ldrb r1, [r7, #1]
	adds r1, r1, r0
	strb r1, [r2, #1]
	adds r0, r4, #0
	movs r1, #0xa
	bl sub_80D6374
	adds r4, r0, #0
	subs r5, #2
	cmp r4, #0
	bgt _080143AA
_080143CE:
	mov r0, r8
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1, #2]
	mov r1, r8
	asrs r0, r1, #1
	adds r0, #1
_080143DC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080143E8: .4byte 0x085C2570

