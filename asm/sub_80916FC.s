	.syntax unified
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8003E6C, 0x08003E6C + 1
	.section .text.sub_80916FC, "ax", %progbits
@ sub_80916FC @ JP 0x080916FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80916FC
	.thumb_func
sub_80916FC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r5, #0
	movs r6, #0x10
	str r5, [r1]
	str r5, [r7]
	movs r0, #1
	bl SetTextFontGlyphs
_08091718:
	ldrb r2, [r4]
	cmp r2, #0x19
	bhi _080917A4
	lsls r0, r2, #2
	ldr r1, _08091728 @ =_0809172C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08091728: .4byte _0809172C
_0809172C: @ jump table
	.4byte _08091796 @ case 0
	.4byte _08091796 @ case 1
	.4byte _08091796 @ case 2
	.4byte _08091794 @ case 3
	.4byte _080917A4 @ case 4
	.4byte _080917A4 @ case 5
	.4byte _080917A4 @ case 6
	.4byte _080917A4 @ case 7
	.4byte _080917A4 @ case 8
	.4byte _080917A4 @ case 9
	.4byte _080917A4 @ case 10
	.4byte _080917A4 @ case 11
	.4byte _080917A4 @ case 12
	.4byte _080917A4 @ case 13
	.4byte _080917A4 @ case 14
	.4byte _080917A4 @ case 15
	.4byte _080917A4 @ case 16
	.4byte _080917A4 @ case 17
	.4byte _080917A4 @ case 18
	.4byte _080917A4 @ case 19
	.4byte _080917A4 @ case 20
	.4byte _080917A4 @ case 21
	.4byte _080917A4 @ case 22
	.4byte _080917A4 @ case 23
	.4byte _08091796 @ case 24
	.4byte _08091796 @ case 25
_08091794:
	adds r5, #8
_08091796:
	mov r1, r8
	ldr r0, [r1]
	cmp r0, r5
	bge _080917A0
	str r5, [r1]
_080917A0:
	movs r5, #0
	ldrb r2, [r4]
_080917A4:
	cmp r2, #0x19
	bhi _08091830
	lsls r0, r2, #2
	ldr r1, _080917B4 @ =_080917B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080917B4: .4byte _080917B8
_080917B8: @ jump table
	.4byte _08091824 @ case 0
	.4byte _08091820 @ case 1
	.4byte _08091824 @ case 2
	.4byte _08091830 @ case 3
	.4byte _08091830 @ case 4
	.4byte _08091830 @ case 5
	.4byte _08091830 @ case 6
	.4byte _08091830 @ case 7
	.4byte _08091830 @ case 8
	.4byte _08091830 @ case 9
	.4byte _08091830 @ case 10
	.4byte _08091830 @ case 11
	.4byte _08091830 @ case 12
	.4byte _08091830 @ case 13
	.4byte _08091830 @ case 14
	.4byte _08091830 @ case 15
	.4byte _08091830 @ case 16
	.4byte _08091830 @ case 17
	.4byte _08091830 @ case 18
	.4byte _08091830 @ case 19
	.4byte _08091830 @ case 20
	.4byte _08091830 @ case 21
	.4byte _08091830 @ case 22
	.4byte _08091830 @ case 23
	.4byte _08091820 @ case 24
	.4byte _08091820 @ case 25
_08091820:
	adds r6, #0x10
	b _08091830
_08091824:
	ldr r0, [r7]
	cmp r0, r6
	bge _0809182C
	str r6, [r7]
_0809182C:
	movs r6, #0
	ldrb r2, [r4]
_08091830:
	adds r0, r2, #0
	cmp r0, #7
	bgt _08091840
	cmp r0, #1
	bge _0809184E
	cmp r0, #0
	beq _08091866
	b _08091856
_08091840:
	cmp r2, #0x16
	blt _08091856
	cmp r2, #0x19
	ble _0809184E
	cmp r2, #0x80
	beq _08091852
	b _08091856
_0809184E:
	adds r4, #1
	b _08091718
_08091852:
	adds r4, #2
	b _08091718
_08091856:
	adds r0, r4, #0
	mov r1, sp
	bl sub_8003E6C
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _08091718
_08091866:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

