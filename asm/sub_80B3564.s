	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8009FE4, 0x08009FE4 + 1
	.set sub_80B3538, 0x080B3538 + 1
	.section .text.sub_80B3564, "ax", %progbits
@ sub_80B3564 @ JP 0x080B3564 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3564
	.thumb_func
sub_80B3564:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x48
	adds r7, r0, #0
	adds r5, r1, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	mov r1, sp
	ldr r0, _080B35A4 @ =0x081F5840
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r7, #0
	bl GetROMChapterStruct
	adds r0, #0x80
	ldrb r0, [r0]
	lsrs r4, r0, #1
	adds r0, r7, #0
	subs r0, #0x24
	cmp r0, #0x13
	bhi _080B35A8
	adds r0, r5, #0
	b _080B3714
	.align 2, 0
_080B35A4: .4byte 0x081F5840
_080B35A8:
	cmp r7, #0x23
	bhi _080B367C
	lsls r0, r7, #2
	ldr r1, _080B35B8 @ =_080B35BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B35B8: .4byte _080B35BC
_080B35BC: @ jump table
	.4byte _080B364C @ case 0
	.4byte _080B367C @ case 1
	.4byte _080B367C @ case 2
	.4byte _080B367C @ case 3
	.4byte _080B367C @ case 4
	.4byte _080B367C @ case 5
	.4byte _080B367C @ case 6
	.4byte _080B367C @ case 7
	.4byte _080B367C @ case 8
	.4byte _080B367C @ case 9
	.4byte _080B367C @ case 10
	.4byte _080B367C @ case 11
	.4byte _080B367C @ case 12
	.4byte _080B367C @ case 13
	.4byte _080B367C @ case 14
	.4byte _080B367C @ case 15
	.4byte _080B367C @ case 16
	.4byte _080B367C @ case 17
	.4byte _080B367C @ case 18
	.4byte _080B367C @ case 19
	.4byte _080B367C @ case 20
	.4byte _080B3664 @ case 21
	.4byte _080B3664 @ case 22
	.4byte _080B367C @ case 23
	.4byte _080B367C @ case 24
	.4byte _080B367C @ case 25
	.4byte _080B367C @ case 26
	.4byte _080B367C @ case 27
	.4byte _080B367C @ case 28
	.4byte _080B367C @ case 29
	.4byte _080B367C @ case 30
	.4byte _080B367C @ case 31
	.4byte _080B367C @ case 32
	.4byte _080B367C @ case 33
	.4byte _080B3664 @ case 34
	.4byte _080B3664 @ case 35
_080B364C:
	add r4, sp, #0x28
	movs r0, #0xe3
	adds r1, r4, #0
	bl sub_8009FE4
	adds r1, r5, #0
	bl sub_80B3538
	adds r5, r0, #0
	movs r0, #0xe7
	adds r1, r4, #0
	b _080B3708
_080B3664:
	add r4, sp, #0x28
	movs r0, #0xe2
	adds r1, r4, #0
	bl sub_8009FE4
	adds r1, r5, #0
	bl sub_80B3538
	adds r5, r0, #0
	movs r0, #0xe7
	adds r1, r4, #0
	b _080B3708
_080B367C:
	add r6, sp, #0x28
	mov r0, r8
	cmp r0, #0
	beq _080B3694
	movs r0, #0xdf
	adds r1, r6, #0
	bl sub_8009FE4
	adds r1, r5, #0
	bl sub_80B3538
	adds r5, r0, #0
_080B3694:
	cmp r4, #9
	ble _080B36B4
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl sub_8009FE4
	adds r1, r5, #0
	bl sub_80B3538
	adds r5, r0, #0
_080B36B4:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	adds r4, r6, #0
	adds r1, r4, #0
	bl sub_8009FE4
	adds r1, r5, #0
	bl sub_80B3538
	adds r5, r0, #0
	movs r0, #0xe0
	adds r1, r4, #0
	bl sub_8009FE4
	adds r1, r5, #0
	bl sub_80B3538
	adds r5, r0, #0
	adds r0, r7, #0
	bl GetROMChapterStruct
	adds r0, #0x80
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B3704
	movs r0, #0xe1
	adds r1, r4, #0
	bl sub_8009FE4
	adds r1, r5, #0
	bl sub_80B3538
	adds r5, r0, #0
_080B3704:
	movs r0, #0xe7
	adds r1, r6, #0
_080B3708:
	bl sub_8009FE4
	adds r1, r5, #0
	bl sub_80B3538
	adds r5, r0, #0
_080B3714:
	add sp, #0x48
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

